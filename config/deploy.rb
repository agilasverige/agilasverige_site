set :application, "agilasverige2008" 
set :user, "agilesweden" 
set :domain, "agilasverige.se" 
set :repository, "git://github.com/mahnve/agilasverige.git" 
set :deploy_to, "/home/agilesweden/apps/#{application}" 

set :scm, :git
set :deploy_via, :remote_cache
set :branch, "master"

role :app, "svr.stjernstrom.se"
role :web, "svr.stjernstrom.se"
role :db, "svr.stjernstrom.se", :primary => true

#default_run_options[:pty] = true

ssh_options[:port] = 22666


desc "Link in the production extras" 
namespace :deploy do
  task :after_symlink do
      # symlink log path
    run "ln -nfs #{shared_path}/log #{release_path}/log" 
  end

  desc "Merb it up" 
  task :restart do
    run "cd #{current_path};merb -K all" 
    # run "cd #{current_path};env EVENT=1 merb -e production -c 1" # for evented mongrel
    run "cd #{current_path}; merb -e production -c 3 -p 12000" # plain old mongrel
  end
  
  
end

after 'deploy:update_code', :copy_database_yml

task :copy_database_yml do
  run "cd #{release_path} && cp ../../db.yml config/database.yml"
end
  
