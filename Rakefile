require 'rake' 
begin
  require 'vlad'
  Vlad.load :scm => 'git', :app => 'thin'
rescue LoadError
  # do nothing
end

require 'spec/rake/spectask' 
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ["--color", '--format', "specdoc"] 
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
