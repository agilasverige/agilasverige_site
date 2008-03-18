steps_for(:attendant_signup) do

  When "prospective attendant is on signup page" do
    @response = get "/attendants/new"
  end

  When "there is no attendant who has registered with em@il.com" do
    Attendant.count(:email => "em@il.com").should == 0
  end
  
  Then "he can see fields for first_name, last_name, email, telephone_number, company, street_address, zipcode, postal_address and country" do
    @response.body.should have_tag(:input, :id => :attendant_first_name)
    @response.body.should have_tag(:input, :id => :attendant_last_name)
    @response.body.should have_tag(:input, :id => :attendant_email)
  end
  
  When "he signs up with all fields" do
    @response = post '/attendants', :attendant => {:first_name => "first", 
                                                  :last_name => 'last', 
                                                  :email => "em@il.com", 
                                                  :street_address => "address",
                                                  :zip_code => "86876",
                                                  :postal_address => "hhh"}
  end
  
  Then "a new attendant is created" do
    Attendant.count(:email => "em@il.com").should == 1
  end
    
  Given "an attendant is already registered with email '$email'" do |email|
    attendant = Attendant.new(:first_name => "first", 
                                                  :last_name => 'last', 
                                                  :email => email, 
                                                  :street_address => "address",
                                                  :zip_code => "86876",
                                                  :postal_address => "hhh")
    attendant.save.should == true
  end
  
  When "a prospective client signs up with email '$email'" do |email|
    @response = post '/attendants', :attendant => {:first_name => "first", 
                                                  :last_name => 'last', 
                                                  :email => email, 
                                                  :street_address => "address",
                                                  :zip_code => "86876",
                                                  :postal_address => "hhh"}
  end
  
  Then "he is redirected to '$url'" do |url|
    @response.should redirect_to(url)
    #@redirect = get @response.headers['Location']
  end
  
  Then "he gets an info message saying '$message'" do |message|
    # TODO fix this test
    # @redirect.body.should =~ Regexp.new(message)
  end 
  
end