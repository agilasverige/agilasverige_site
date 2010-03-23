require 'rubygems'
require 'rake' 
begin
  require 'vlad'
  Vlad.load :scm => 'git'
rescue LoadError
  # do nothing
end

require 'spec/rake/spectask' 
Spec::Rake::SpecTask.new("spec") do |t|
  t.spec_opts = ["--color", '--format', "specdoc"] 
  t.spec_files = FileList["spec/**/*_spec.rb"]
end 

require 'cucumber/rake/task'

Cucumber::Rake::Task.new

task :default => [:spec, :cucumber]

namespace :vlad do

  task :deploy => ['vlad:update','vlad:start_app']
    
  desc 'Restart Passenger'
  remote_task :start_app, :roles => :app do
    run "mkdir #{current_release}/tmp"
    run "touch #{current_release}/tmp/restart.txt"
  end

end

require "metric_fu"

