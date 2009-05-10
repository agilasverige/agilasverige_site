require File.join(File.dirname(__FILE__), '..', 'start')
require 'spec/expectations'
require 'cucumber/formatters/unicode'
ARGV={}
require 'webrat/ramaze'
require 'webrat/core/matchers'

Webrat.configure do |config|
  config.mode = :ramaze
end

include Webrat::Methods
include Webrat::Matchers

