require 'rubygems'
require 'rake' 
begin
  require 'vlad'
  Vlad.load :scm => 'git'
rescue LoadError
  # do nothing
end

task :spec do
  `bacon -a`
end

require 'cucumber/rake/task'

Cucumber::Rake::Task.new

task :default => [:spec, :features]

namespace :vlad do

  task :deploy => ['vlad:update','vlad:restart']
    
  task :restart
  desc 'Restart Passenger'
  remote_task :start_app, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

end

require "metric_fu"

