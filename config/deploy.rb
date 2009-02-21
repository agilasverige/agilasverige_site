set :application, "agilasverige" 
set :user, "agilesweden" 
set :domain, "agilasverige" 
set :repository, "git://github.com/mahnve/agilasverige.git" 
set :deploy_to, "/home/agilesweden/apps/#{application}" 

set :branch, "master"
set :web, "nginx"


#default_run_options[:pty] = true

set :ssh_flags,             '-p 22666'


desc "Link in the production extras" 
namespace :vlad do
  remote_task :after_symlink do
    run "ln -nfs #{shared_path}/log #{current_path}/log" 
  end

  desc "Start it up" 
  remote_task :start_app do
    run "cd #{current_path};./start.sh" 
  end

  desc "Tear it down" 
  remote_task :stop_app do
    run "cd #{current_path};./stop.sh" 
  end

end
remote_task :deploy => ["vlad:update", "vlad:stop_app", "vlad:start_app"]

remote_task :copy_database_yml => 'deploy:update_code' do
  run "cd #{release_path} && cp ../../db.yml config/database.yml"
end
  
