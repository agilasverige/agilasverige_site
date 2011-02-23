default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "agilasverige" 
set :user, "agilasverige" 
set :domain, "agilasverige" 

set :port, 22666
set :deploy_to, "/home/agilasverige/apps/#{application}" 

set :repository, "git://github.com/agilasverige/agilasverige_site.git" 
set :branch, "master"
set :scm, :git
set :deploy_via, :remote_cache

role :web, "agilasverige.cust.globalinn.com"                          # Your HTTP server, Apache/etc
role :app, "agilasverige.cust.globalinn.com"                          # This may be the same as your `Web` server
role :db,  "agilasverige.cust.globalinn.com", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
