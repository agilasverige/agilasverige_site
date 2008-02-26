steps_for(:attendant_signup) do

  When "prospective attendant is on signup page" do
    get "/attendants/new"
  end
  
  Then "he can see fields for first_name, last_name, email, telephone_number, company, street_address, zipcode, postal_address and country" do
    pending "view"
  end
  
end