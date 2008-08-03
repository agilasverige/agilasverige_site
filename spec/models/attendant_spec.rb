require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe "An regular attendant", Attendant do

  before :each do
    @attendant = Attendant.new
  end

  it "should require a first name" do
    @attendant.save.should == false
    @attendant.errors.full_messages.should include("måste fyllas i")
    @attendant.first_name = "first"
    @attendant.first_name.should == "first"
  end
  
  it "should have a last name" do
    @attendant.last_name = "last"
    @attendant.last_name.should == "last"
  end
  
  it "should have an email address" do
    @attendant.email = "em@il.com"
    @attendant.email.should == "em@il.com"
  end
  
  it "should have c/o address" do
    @attendant.co_address = "owner"
    @attendant.co_address.should == "owner"
  end

  it "should have a street address" do
    @attendant.street_address = "address"
    @attendant.street_address.should == "address"
  end
  
  it "should have a zip_code" do
    @attendant.zip_code = "12122"
    @attendant.zip_code.should == "12122"
  end
  
  it "should have a postal_address" do
    @attendant.postal_address = "pad"
    @attendant.postal_address.should == "pad"
  end
  
  it "should have a country" do
    @attendant.country = "Sweden"
    @attendant.country.should == "Sweden"
  end
  
  it "should have a organization" do
    @attendant.organization = "com"
    @attendant.organization.should == "com"
  end
  
  it "should have a telephone number" do
    @attendant.telephone_number = "000"
    @attendant.telephone_number.should == "000"
  end
  
  it "should have a option to want to speak" do
    @attendant.wants_to_speak = true
    @attendant.wants_to_speak.should == true
  end

  it "should have a full name" do
    @attendant.first_name = "hej"
    @attendant.last_name = "då"
    @attendant.full_name.should == "hej då"
  end

  it "has no speaking proposals" do
    @attendant.speaking_proposals.size.should == 0
  end
end

describe "An attendant with two speaking proposals" do


  it "should be a prospective speaker" do
    create_attendant_with_two_speaking_proposals('email1@for.two')
    @attendant.prospective_speaker?.should == true
  end
  

  it "should have two speaking proposals" do
    create_attendant_with_two_speaking_proposals('email2@for.two')
    @attendant.speaking_proposals.size.should == 2
  end

  def create_attendant_with_two_speaking_proposals(email_address)
    @attendant = Attendant.new(:first_name => 'first',
                               :last_name => 'last',
                               :email => email_address,
                               :street_address => 'street',
                               :zip_code => '13434',
                               :postal_address => 'poaddress')
    @attendant.save
    @attendant.speaking_proposals.create :title => "hej"
    @attendant.speaking_proposals.create :title  => "hej"
  end
end

describe "An attendant with accepted proposals" do
    
  it "should be a speaker" do
    create_attendant_with_accepted_proposal
    @attendant.speaker?.should == true
  end

  def create_attendant_with_accepted_proposal
    @attendant = Attendant.new(:first_name => 'first',
                               :last_name => 'last',
                               :email => 'm@hej.ghf',
                               :street_address => 'street',
                               :zip_code => '13434',
                               :postal_address => 'poaddress')
    @attendant.save
    @attendant.speaking_proposals.create :title => "hej", :accepted => true
  end
end

describe "An attendant with a not accepted proposal" do
  
  it "should be an attendant???"
    
end


describe "an attendant registering with the the same email address as already registered" do
  
  
  it "should receive error message saying it is already registered" do
    attendant = create_attendant('same@email.address')
    attendant2 = create_attendant('same@email.address')
    attendant2.valid?.should be_false
    attendant2.errors.on(:email).should include("redan registrerad")
  end

  def create_attendant(email_address)
    Attendant.create(:first_name => "first", 
                     :last_name => 'last', 
                     :email => email_address,
                     :street_address => "address",
                     :zip_code => "16876",
                     :postal_address => "hhh")

  end
end

