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

namespace :couchdb do
  desc 'starts couchdb'
  task :start do
    sh 'couchdb -C config/couchdb.ini -p couchdb/pid -b'
  end
  desc 'stops couchdb'
  task :stop do
    sh 'couchdb -C config/couchdb.ini -p couchdb/pid -d'
  end
  desc 'checks status couchdb'
  task :status do
    sh 'couchdb -C config/couchdb.ini -p couchdb/pid -s'
  end
end
