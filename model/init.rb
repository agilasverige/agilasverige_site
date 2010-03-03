require 'activesupport'
gem 'activesupport', :version => '2.3.5'

require 'mongo_mapper'

MongoMapper.database = 'agilesweden'

require File.expand_path(File.join(File.dirname(__FILE__), 'attendant'))
require File.expand_path(File.join(File.dirname(__FILE__), 'speaking_proposal'))
