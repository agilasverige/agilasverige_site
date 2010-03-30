Given /^I am a logged in administrator$/ do
  BaseEmail.testing
  Attendant.delete_all
  @attendant1 = Factory(:attendant)
  @attendant2 = Factory(:attendant)
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

When /^I enter a email subject$/ do
  fill_in 'subject', 'This is an email subject'
end

When /^I click send button$/ do
  click_button 'Skicka'
end

Then /^an email is sent to all attendants$/ do
  @sent_email = BaseEmail.sent_emails.first
  @sent_email.bcc.should include @attendant1.email
  @sent_email.bcc.should include @attendant2.email
end

Then /^a copy is sent to as\-xx list$/ do
  @sent_email.bcc.should include 'as-xx@googlegroups.com'
end

