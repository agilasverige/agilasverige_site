steps_for(:attendant_signup) do

  When "prospective attendant is on signup page" do
    @response = get "/anmal"
  end
  
  Then "he can see fields for first_name, last_name, email, telephone_number, company, street_address, zipcode, postal_address and country" do
    puts "class #{@response}"
    @response.body.should have_tag(:input, :id => :attendant_first_name)
  end
  
  When "he signs up with all fields" do
    pending
  end
  
  Then "a new attendant is created" do
    pending
  end
    
  When "a prospective client signs up with an already registered email address" do
    pending
  end
  
  Then "he gets an info message saying it is already taken" do
    pending
  end
  
end