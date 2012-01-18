Given /^a visitor$/ do
	visit "/" 
end

When /^I surf to the old conference page$/ do
	click_link("Tidigare konferenser")
end

Then /^I want to see a link to the program for (\d+)$/ do |year|
	page.should have_link("Agila Sverige #{year}")
end

