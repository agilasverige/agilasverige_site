set :application, "agilasverige" 
set :user, "agilesweden" 
set :domain, "agilasverige" 
set :repository, "git://github.com/mahnve/agilasverige.git" 
set :deploy_to, "/home/agilesweden/apps/#{application}" 

set :branch, "master"


#default_run_options[:pty] = true

set :ssh_flags,             '-p 22666'


desc "Link in the production extras" 
namespace :vlad do
  remote_task :after_symlink do
    # symlink log path
    run "ln -nfs #{shared_path}/log #{release_path}/log" 
  end

  desc "Merb it up" 
  remote_task :restart do
    run "cd #{current_path};merb -K all" 
    # run "cd #{current_path};env EVENT=1 merb -e production -c 1" # for evented mongrel
    run "cd #{current_path}; merb -e production -c 3 -p 12000" # plain old mongrel
  end
  
  
end

remote_task :copy_database_yml => 'deploy:update_code' do
  run "cd #{release_path} && cp ../../db.yml config/database.yml"
end
  
