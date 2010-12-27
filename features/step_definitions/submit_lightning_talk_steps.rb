# coding: utf-8
Given /^I am a registered attendant$/ do
  SpeakingProposal.delete_all(:title => 'test')
  @attendant = Factory(:attendant)
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
  visit "/attendant/#{@attendant.uid}"
  page.should have_content('test')  
end

