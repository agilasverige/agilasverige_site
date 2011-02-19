# coding: utf-8
Given /^I am a registered attendant with:$/ do |table|
  @user = User.make!(table.rows_hash)
  @user.confirm!
end

Given /^I am logged in with "(.*)":"(.*)"$/ do |email, password|
  Given %Q{I follow "Logga in"}
  And %Q{I fill in "#{email}" for "E-postadress"}
  And %Q{I fill in "#{password}" for "Lösenord"}
  And %q{I press "Logga in"}
end
