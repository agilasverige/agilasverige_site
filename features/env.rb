require 'ramaze'
Ramaze.options.started = true
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'app'))

require "factory_girl"
require 'spec/expectations'
require 'rack/test'

Ramaze.setup_dependencies 
extend Rack::Test::Methods
def app; Ramaze.middleware; end

require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'

Capybara.app=Ramaze

class AdminController
  before_all 
end
