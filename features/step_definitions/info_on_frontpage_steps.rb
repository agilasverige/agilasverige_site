require 'capybara'
include Capybara

Given /^I am a visitor$/ do
end  

When /^I surf to the front page$/ do
  visit "/"
end

Then /^I should see (.*) in the text$/ do |text|
  page.should have_content(text)
end

Then /^I should see a submenu$/ do
  page.should have_css("#submenu")
end

