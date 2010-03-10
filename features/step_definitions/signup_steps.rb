TEST_EMAIL_ADDRESS = 'mahnve+test@gmail.com'

Given /^I am a previously unregistered visitor$/ do
  Attendant.all(:email => TEST_EMAIL_ADDRESS).each {|a| a.destroy}
end

When /^I register as an attendant$/ do
  visit '/attendant/new'
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
  attendant = Attendant.first(:email => TEST_EMAIL_ADDRESS)
  attendant.first_name.should == 'Demo'
end

Then /^a uid is generated$/ do
  attendant = Attendant.first(:email => TEST_EMAIL_ADDRESS)
  attendant.uid.should_not == nil
end

Then /^I receive an email with an unique link$/ do
  #TODO
end

Given /^I have previously signed up as an attendant$/ do
  clean_test_data
  attendant = Attendant.new
  attendant.first_name = 'Attendant'
  attendant.last_name = 'Attendantsson'
  attendant.organization = 'Organization'
  attendant.email = 'attendant@localhost.com'
  attendant.address = 'address'
  attendant.zip_code = '12345'
  attendant.postal_address = 'Postal Address'
  attendant.country = 'Country'
  attendant.save
end

Then /^I get an error message$/ do
  response_body.should have_selector('#message')
end


Then /^I see a confirmation page$/ do
  attendant = Attendant.find_by_email(TEST_EMAIL_ADDRESS)
  page.should have_content('Tack för din anmälan')
end

Then /^I get a confirmation email$/ do
  
end

