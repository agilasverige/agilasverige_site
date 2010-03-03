Given /^I am a previously unregistered visitor$/ do
  Attendant.all(:email => 'demo@real.com').each {|a| a.destroy}
end

When /^I register as an attendant$/ do
  visit '/attendant/new'
  fill_in 'first_name', :with => 'Demo'
  fill_in 'last_name', :with => 'Demosson'
  fill_in 'email', :with => 'demo@real.com'
  fill_in 'address', :with => 'Demoaddress 19'
  fill_in 'organization', :with => 'Superorganization'
  fill_in 'zip_code', :with => '12122'
  fill_in 'postal_address', :with => 'Demoland'
  click 'Anmäl'
end

Then /^my information is saved$/ do
  attendant = Attendant.first(:email => 'demo@real.com')
  attendant.first_name.should == 'Demo'
end

Then /^a uid is generated$/ do
  attendant = Attendant.first(:email => 'demo@real.com')
  attendant.uid.should_not == nil
end

Then /^I receive an email with an unique link$/ do
  pending # express the regexp above with the code you wish you had
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


When /^I register as an? (.*) with correct data$/ do |attendant_type|
  visit '/'
  click_link 'Anmäl dig här'
  fill_in 'first_name', :with => 'First Name' 
  fill_in 'last_name', :with => 'Last Name' 
  fill_in 'email', :with => "#{attendant_type}@localhost.com"
  fill_in 'organization', :with => 'organization' 
  fill_in 'address', :with => 'address'
  fill_in 'zip_code', :with => '12345'
  fill_in 'postal_address', :with => 'postal address'
  fill_in 'country', :with => 'country'
  fill_in 'telephone_number', :with => '000-000-000'
  check 'attending_dinner'
  fill_in 'food_preferences', :with => 'vegetarian'
  fill_in 'comments', :with => 'comments'
  if attendant_type == 'speaker'
    check 'wants_to_speak'
    fill_in 'title', :with => 'title'
    fill_in 'abstract', :with  => 'abstract'
  end
  click_button 'Anmäl'
end

Then /^my attendant information is stored$/ do
  attendant = Attendant.by_email(:key => 'attendant@localhost.com').first
  attendant.first_name.should == 'First Name'
  @id = attendant.id
end

Then /^I get an error message$/ do
  response_body.should have_selector('#message')
end

Then /^my speaker information is stored$/ do
  speaker = Attendant.by_email(:key => 'speaker@localhost.com').first
  speaker.speaking_proposal.title.should == 'title'
  speaker.speaking_proposal.abstract.should == 'abstract'
  @id = speaker.id
end

Then /^I see a confirmation page$/ do
  current_page.url.should == "/attendant/#{@id}/thanks"
end

Then /^I get a confirmation email$/ do
  
end

def clean_test_data
  Attendant.by_email(:key => "attendant@localhost.com").each do |entry|
    entry.destroy
  end
  Attendant.by_email(:key => "speaker@localhost.com").each do |entry|
    entry.destroy
  end
end
