require File.join(File.dirname(__FILE__), '..', 'env.rb')

Given /^I am a visitor$/ do
end  


When /^I surf to the front page$/ do
  visit "/"
end

Then /^I should see (.*)$/ do |text|
  response_body.should contain /text/i
end

