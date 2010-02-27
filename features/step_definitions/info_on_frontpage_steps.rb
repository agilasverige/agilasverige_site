include Capybara

Given /^I am a visitor$/ do
end  

When /^I surf to the front page$/ do
  visit "/"
end

Then /^I should see (.*)$/ do |text|
  page.should have_content(text)
end

