set :application, "agilasverige" 
set :user, "agilasverige" 
set :domain, "agilasverige" 
set :repository, "git://github.com/agilasverige/agilasverige_site.git" 
set :deploy_to, "/home/agilasverige/apps/#{application}" 
set :branch, "master"
set :ssh_flags, '-p 22666'
