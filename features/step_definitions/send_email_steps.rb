Given /^I am a logged in administrator$/ do
  BaseEmail.testing
  Attendant.delete_all
  @attendant = Factory(:attendant)
  @lars = Factory(:lars)
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
  click_button 'Skicka'
end

Then /^an email is sent to all attendants$/ do
  @sent_email = BaseEmail.sent_emails.first
  @sent_email.to.should include @attendant.email
  @sent_email.to.should include @lars.email
end

Then /^a copy is sent to as\-xx list$/ do
  @sent_email.to.should include 'as-xx@googlegroups.com'
end

