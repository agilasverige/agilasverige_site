require File.join(File.dirname(__FILE__), '..', 'env.rb')

Given /^I have previously not signed up$/ do
  Attendant.by_last_name(:key => "Last Name").each do |entry|
    entry.destroy
  end

end

When /^I register for the conference with correct data$/ do
  visit '/attendant/new'
  fill_in 'first_name', :with => 'First Name' 
  fill_in 'last_name', :with => 'Last Name' 
  fill_in 'email', :with => 'email@localhost.com'
  fill_in 'organization', :with => 'organization' 
  fill_in 'address', :with => 'address'
  fill_in 'zip_code', :with => '12345'
  fill_in 'postal_address', :with => 'postal address'
  fill_in 'country', :with => 'country'
  check 'attending_dinner'
  fill_in 'food_preferences', :with => 'vegetarian'
  fill_in 'comments', :with => 'comments'
  click_button 'Anmäl'
end

Then /^my personal information is stored$/ do
  attendant = Attendant.by_last_name(:key => 'Last Name').first
  attendant.first_name.should == 'First Name'
  @id = attendant.id
end

Then /^I see a confirmation page$/ do
  current_page.url.should == "/attendant/#{@id}/thanks"
end

Then /^I get a confirmation email$/ do
  pending
end

