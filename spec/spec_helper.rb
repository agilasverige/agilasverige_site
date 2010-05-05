require 'rubygems'

gem 'activesupport','2.3.5'
require 'activesupport'

require 'spec'
require 'ramaze'
require 'ffaker'
require "factory_girl"

require File.join(File.dirname(__FILE__), '..','model', 'init')
require File.join(File.dirname(__FILE__), '..','view', 'init') 
require File.join(File.dirname(__FILE__), '..','lib', 'init') 
require File.join(File.dirname(__FILE__), '..','controller', 'init') 

