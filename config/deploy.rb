set :application, "agilasverige" 
set :user, "???" 
set :domain, "a" 
set :repository, "svn+ssh://#{user}@#{domain}/var/www/apps/repos/#{application}/trunk" 
set :deploy_to, "/var/www/apps/#{application}" 

set :scm, "git"

role :app, domain
role :web, domain
role :db, domain, :primary => true

desc "Link in the production extras" 
task :after_symlink do
    # symlink log path
  run "ln -nfs #{shared_path}/log #{release_path}/log" 
    # symlink path to database, this is only needed if you are using sqlite (which is ok for little things and is really easy)
  run "ln -nfs #{shared_path}/db/#{application}_production.sqlite3 #{release_path}/db/#{application}_production.sqlite3" 
end

desc "Merb it up" 
task :restart do
  run "cd #{current_path};./script/stop_merb" 
  # run "cd #{current_path};env EVENT=1 merb -e production -c 1" # for evented mongrel
  run "cd #{current_path}; merb -e production -c 1" # plain old mongrel
end