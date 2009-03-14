require File.dirname(__FILE__) + '/../../start'
require 'webrat/ramaze'
require 'spec/expectations'
require 'cucumber/formatters/unicode'

Webrat.configure do |config|
  config.mode = :ramaze
end

include Webrat::Methods

Given /^I am a visitor$/ do
end  


When /^I surf to the front page$/ do
  visit "/"
end

Then /^I should see (.*)$/ do |text|
  response_body.downcase.should include text.downcase
end

