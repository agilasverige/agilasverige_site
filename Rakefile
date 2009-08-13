require 'rubygems'
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

task :default => [:spec, :features]

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

namespace :vlad do
  namespace :couchdb do
    desc 'starts couchdb on server'
    remote_task :start do
      run "couchdb -C config/couchdb.ini -p couchdb/pid -b"
    end
  end
  desc 'stops couchdb'
  remote_task :stop do
    run 'couchdb -C config/couchdb.ini -p couchdb/pid -d'
  end
  desc 'checks status couchdb'
  remote_task :status do
    run 'couchdb -C config/couchdb.ini -p couchdb/pid -s'
  end

  task :deploy => ['vlad:update','vlad:start']
end
