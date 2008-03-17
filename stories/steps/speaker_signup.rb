steps_for(:speaker_signup) do

  When "prospective speaker is on signup page" do
    @response = get "/attendants/new"
  end
  
  Then "he can see all the input fields" do
    @response.body.should have_tag(:input, :id => :speaking_proposal_title)
    @response.body.should have_tag(:textarea, :id => :speaking_proposal_description)
    @response.body.should have_tag(:select, :id => :speaking_proposal_level)
  end
  
  When "signing up as a prospective speaker with email '$email'" do |email|
    @response = post '/attendants', {:attendant => {:first_name => "first", 
                                                  :last_name => 'last', 
                                                  :email => email, 
                                                  :street_address => "address",
                                                  :zip_code => "86876",
                                                  :postal_address => "hhh",
                                                  :wants_to_speak => "1"},
                                     :speaking_proposal => {:title => "titel",
                                                            :description => "des",
                                                            :level => "medel"}}
  end
  
  Then "a new attendant with speaking proposal is created" do
    attendant = Attendant.first(:email => "spe@ker.se")
    attendant.first_name.should == "first"
    attendant.speaking_proposals.size.should == 1
  end

  Given "a speaker is already registered" do
    @registered_attendant = Attendant.new(:first_name => "first", 
                                         :last_name => 'last', 
                                         :email => "already@registered.com", 
                                         :street_address => "address",
                                         :zip_code => "86876",
                                         :postal_address => "hhh")
    @registered_attendant.save.should == true
    @registered_attendant.speaking_proposals.create(:title => "titel1",
                                                   :description => "des",
                                                   :level => "medel")
  end
  
  When "he signs up with a new proposal and the same email address" do
    @response = post '/attendants', {:attendant => {:email => "already@registered.com", 
                                                    :wants_to_speak => "1"},
                                     :speaking_proposal => {:title => "titel2",
                                                            :description => "des2",
                                                            :level => "medel2"}}
    
  end
  
  Then "the new proposal is registered to him" do
    attendant = Attendant.first(:email => "already@registered.com")
    attendant.speaking_proposals.size.should == 2
  end
  
end