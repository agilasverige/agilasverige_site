#!/usr/bin/env ruby
require 'rubygems'
require 'ramaze'

# require all controllers and models
Ramaze::Log.ignored_tags = [:debug, :info]
#Ramaze::Global.sourcereload = true
Ramaze::Global.view_root = ''

pid_dir = File.join(__DIR__,'pid')
FileUtils.mkdir_p(pid_dir)

unless Ramaze::Log.loggers.size == 2
  logdir = File.join(__DIR__,'log')
  logfile = File.join(logdir,"ramaze_#{Time.now.strftime('%Y%m%d%H%M%S')}.log")

  FileUtils.mkdir_p(logdir)
  logger = Ramaze::Logger::Informer.new(logfile)
  Ramaze::Log.loggers << logger
end
#
# Add directory start.rb is in to the load path, so you can run the app from
# any other working path
$LOAD_PATH.unshift(__DIR__)

# Initialize controllers and models
require 'controller/init'
require 'model/init'
require 'view/init'
require 'lib/init'
require 'infrastructure/attendant_repository'
  
#Ramaze.start :adapter => :mongrel, :port => 7000

