require 'activesupport'

require 'mongo_mapper'

MongoMapper.database = 'agilesweden'

require File.expand_path(File.join(File.dirname(__FILE__), 'speaking_proposal'))
require File.expand_path(File.join(File.dirname(__FILE__), 'attendant'))
