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
  
namespace :spec do 
  desc "Run specs with RCov" 
  Spec::Rake::SpecTask.new('rcov') do |t| 
    t.spec_files = FileList['spec/**/*_spec.rb'] 
    t.rcov = true 
    t.rcov_opts = ['--exclude', '\/Library\/Ruby'] 
  end 
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
