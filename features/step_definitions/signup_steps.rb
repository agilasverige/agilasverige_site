TEST_EMAIL_ADDRESS = 'mahnve+test@gmail.com'

Given /^I am a previously unregistered visitor$/ do
  User.all(:email => TEST_EMAIL_ADDRESS).each {|a| a.destroy}
   BaseEmail.testing
end

When /^I register as an user$/ do
  visit '/user/new'
  fill_in 'first_name', :with => 'Demo'
  fill_in 'last_name', :with => 'Demosson'
  fill_in 'email', :with => TEST_EMAIL_ADDRESS
  fill_in 'address', :with => 'Demoaddress 19'
  fill_in 'organization', :with => 'Superorganization'
  fill_in 'zip_code', :with => '12122'
  fill_in 'postal_address', :with => 'Demoland'
  click 'Anmäl'
end

Then /^my information is saved$/ do
  user = User.first(:email => TEST_EMAIL_ADDRESS)
  user.first_name.should == 'Demo'
end

Then /^a uid is generated$/ do
  user = User.first(:email => TEST_EMAIL_ADDRESS)
  user.uid.should_not == nil
end

Then /^I receive an email with an unique link$/ do
  #TODO
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

