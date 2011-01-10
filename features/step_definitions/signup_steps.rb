# coding: utf-8
TEST_EMAIL_ADDRESS = 'mahnve+test@gmail.com'

Given /^I am a previously unregistered visitor$/ do
end

Given /^I have previously signed up as an user$/ do
  clean_test_data
  Factory(:user)
end

Then /^I get an error message$/ do
  response_body.should have_selector('#message')
end


Then /^I see a confirmation page$/ do
  user = User.find_by_email(TEST_EMAIL_ADDRESS)
  page.should have_content('Tack för din anmälan')
end

Then /^I get a confirmation email$/ do
  BaseEmail.sent_emails.first.to.should == TEST_EMAIL_ADDRESS  
end

