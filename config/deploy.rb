set :application, "agilasverige" 
set :user, "agilesweden" 
set :domain, "agilasverige" 
set :repository, "git://github.com/mahnve/agilasverige.git" 
set :deploy_to, "/home/agilasverige/apps/#{application}" 

set :branch, "master"

set :thin_port, 12000
set :thin_servers, 3

set :ssh_flags,             '-p 22666'
