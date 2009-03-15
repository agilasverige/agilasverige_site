require File.join(File.dirname(__FILE__), '..', 'start')
require 'webrat/ramaze'
require 'webrat/core/matchers'
require 'spec/expectations'
require 'cucumber/formatters/unicode'

Webrat.configure do |config|
  config.mode = :ramaze
end

include Webrat::Methods
include Webrat::Matchers

