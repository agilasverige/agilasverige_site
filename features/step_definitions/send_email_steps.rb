# coding utf-8
Given /^I am a logged in administrator$/ do
  BaseEmail.testing
  User.delete_all
  @user1 = User.make
  @user2 = User.make
end

When /^I select to send an email$/ do
  visit '/admin/email/new' 
end

When /^I select all users as recipients$/ do
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

Then /^an email is sent to all users$/ do
  @sent_email = BaseEmail.sent_emails.first
  @sent_email.bcc.should include @user1.email
  @sent_email.bcc.should include @user2.email
end

Then /^a copy is sent to as\-xx list$/ do
  @sent_email.bcc.should include 'as-xx@googlegroups.com'
end

Given /^the following attendants exist:$/ do |table|
  table.hashes.each do |row|
    user = User.make(:email => row[:email])
    user.attending_dinner = row[:dinner]
    if(row[:speaker])
      SpeakingProposal
    end

  end
end

When /^an admin sends an email to everyone$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^'$/ do
  pending # express the regexp above with the code you wish you had
end



