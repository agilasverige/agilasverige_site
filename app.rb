#!/usr/bin/env ruby
require 'rubygems'
gem 'ramaze', '= 2009.07'
require 'ramaze'

# require all controllers and models
# Ramaze::Log.ignored_tags=[:debug, :info]
#Ramaze::Global.sourcereload = true

pid_dir = File.join(__DIR__,'pid')
FileUtils.mkdir_p(pid_dir)

# unless Ramaze::Log.loggers.size == 2
#   logdir = File.join(__DIR__,'log')
#   logfile = File.join(logdir,"ramaze_#{Time.now.strftime('%Y%m%d%H%M%S')}.log")
# 
#   FileUtils.mkdir_p(logdir)
#   logger = Ramaze::Logger::Informer.new(logfile)
#   Ramaze::Log.loggers << logger
# end

Ramaze.options.cache.session = Ramaze::Cache::Marshal

# Add directory start.rb is in to the load path, so you can run the app from
# any other working path
$LOAD_PATH.unshift(__DIR__)

# Ramaze::Global.root = File.dirname(__FILE__)

# Initialize controllers and models
require 'controller/init'
require 'model/init'
require 'view/init'
require 'lib/init'
  

