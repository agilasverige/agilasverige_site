Given /^I am a logged in administrator$/ do
  EmailSender.testing
end

When /^I select to send an email$/ do
  visit '/admin/email/new' 
end

When /^I select all attendants as recipients$/ do
  # all implied
end

When /^I enter a text body$/ do
  fill_in 'email_body', 'This is an email text'
end

When /^I click send button$/ do
  click_button 'send'
end

Then /^an email is sent to all attendants$/ do
  # ???
end

Then /^a copy is sent to as\-xx list$/ do
  pending # express the regexp above with the code you wish you had
end

