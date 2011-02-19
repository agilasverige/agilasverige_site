set :application, "agilasverige" 
set :user, "agilasverige" 
set :domain, "agilasverige" 
set :repository, "git://github.com/agilasverige/agilasverige_site.git" 
set :deploy_to, "/home/agilasverige/apps/#{application}" 
set :branch, "master"
set :ssh_flags, '-p 22666'
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "agilasverige.cust.globalinn.com"                          # Your HTTP server, Apache/etc
role :app, "agilasverige.cust.globalinn.com"                          # This may be the same as your `Web` server
role :db,  "agilasverige.cust.globalinn.com", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
