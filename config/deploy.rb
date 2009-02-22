set :application, "agilasverige" 
set :user, "agilesweden" 
set :domain, "agilasverige" 
set :repository, "git://github.com/mahnve/agilasverige.git" 
set :deploy_to, "/home/agilesweden/apps/#{application}" 

set :branch, "master"
set :web, "nginx"


#default_run_options[:pty] = true

set :ssh_flags,             '-p 22666'

namespace :vlad do
  ##
  # ramaze app server

  set :ramaze_address,       "127.0.0.1"
  set :ramaze_clean,         false
  set :ramaze_command,       'ramaze'
  set(:ramaze_conf)          nil
  set :ramaze_config_script, nil
  set :ramaze_environment,   "live"
  set :ramaze_group,         nil
  set :ramaze_log_file,      nil
  set :ramaze_pid_file,      nil
  set :ramaze_port,          7000
  set :ramaze_prefix,        nil
  set :ramaze_servers,       3
  set :ramaze_user,          nil

  desc "Prepares application servers for deployment. ramaze
configuration is set via the ramaze_* variables.".cleanup

  remote_task :setup_app, :roles => :app do
    'rake'
  end

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
