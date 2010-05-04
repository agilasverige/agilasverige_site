require 'activesupport'

require 'mongo_mapper'
require 'joint'

MongoMapper.database = 'agilesweden'

require File.expand_path(File.join(File.dirname(__FILE__), 'speaking_proposal'))
require File.expand_path(File.join(File.dirname(__FILE__), 'attendant'))
