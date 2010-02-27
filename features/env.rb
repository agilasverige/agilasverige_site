require 'ramaze'
Ramaze.options.started = true
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'app'))

require 'spec/expectations'
require 'rack/test'

Ramaze.setup_dependencies 
extend Rack::Test::Methods
def app; Ramaze.middleware; end

require 'capybara'
require 'capybara/cucumber'

Capybara.app=Ramaze
