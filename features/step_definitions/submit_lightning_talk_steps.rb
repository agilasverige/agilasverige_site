Given /^I am a registered attendant$/ do
  SpeakingProposal.delete_all(:title => 'test')
  @attendant = Attendant.create(:first_name => 'test',
                                :last_name => 'testsson',
                                :email => 'mahnve+test@gmail.com',
                                :organization => 'organization',
                                :address => 'address',
                                :zip_code => '12121',
                                :postal_address => 'postal address')
end

When /^I submit a lightning talk$/ do
  visit "/attendant/#{@attendant.uid}"
  click_link "submit_lightning_talk"
  fill_in 'Titel', :with => 'test'
  fill_in 'Beskrivning', :with => 'testelitest'
  click_button 'Anmäl'
end

Then /^my lightning is stored$/ do
  SpeakingProposal.find_by_title("test").should be_true
end

Then /^it is shown on my page$/ do
  pending # express the regexp above with the code you wish you had
end

