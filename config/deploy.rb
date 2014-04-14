set :rvm_ruby_string, '1.9.2@agilasverige'        # Or whatever env you want it to run in.
set :rvm_path, '/usr/local/rvm'
set :rvm_bin_path, '/usr/local/rvm/bin'

require "rvm/capistrano"                  # Load RVM's capistrano plugin.

require 'new_relic/recipes'
require "bundler/capistrano"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "agilasverige" 
set :user, "agilasverige" 
set :domain, "agilasverige" 
set :use_sudo, false

set :port, 22666
set :deploy_to, "/home/agilasverige/apps/#{application}" 

set :repository, "git://github.com/agilasverige/agilasverige_site.git" 
set :branch, "master"
set :scm, :git
set :deploy_via, :remote_cache

# Not much diskspace on our server
set :keep_releases, 3

role :web, "agilasverige.cust.globalinn.com"                          # Your HTTP server, Apache/etc
role :app, "agilasverige.cust.globalinn.com"                          # This may be the same as your `Web` server
role :db,  "agilasverige.cust.globalinn.com", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/payson.yml #{release_path}/config/payson.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/files #{release_path}/public/files"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
end

desc "remotely console"
task :console, :roles => :app do
  input = ''
  run "cd #{current_path} && rails console #{ENV['RAILS_ENV']}" do |channel, stream, data|
    next if data.chomp == input.chomp || data.chomp == ''
    print data
    channel.send_data(input = $stdin.gets) if data =~ /:\d{3}\s>/
  end
end

require 'rollbar/capistrano'
set :rollbar_token, '7f7e772321a748e4b5c470b5aec54355'

after "deploy", "newrelic:notice_deployment"
after "deploy:update", "newrelic:notice_deployment"
after "deploy:migrations", "newrelic:notice_deployment"
after "deploy:cold", "newrelic:notice_deployment"

after 'deploy:update_code', 'deploy:symlink_shared'

# Clean out old releases
after "deploy:update", "deploy:cleanup"
