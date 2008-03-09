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


  it "has no speaking proposals" do
    @attendant.speaking_proposals.size.should == 0
  end
end

describe "An attendant with two speaking proposals" do

  before(:each) do
    @attendant = Attendant.new
    @speaking_proposal1 = SpeakingProposal.new
    @speaking_proposal2 = SpeakingProposal.new
    @attendant.add_speaking_proposal @speaking_proposal1
    @attendant.add_speaking_proposal @speaking_proposal2
  end

  it "should be a prospective speaker" do
    @attendant.prospective_speaker?.should == true
  end
  

  it "should have two speaking proposals" do
    @attendant.speaking_proposals.size.should == 2
  end
end

describe "An attendant with accepted proposals" do
  before(:each) do
    @attendant = Attendant.new
    proposal = SpeakingProposal.new
    proposal.stub!(:accepted?).and_return(true)
    @attendant.add_speaking_proposal(proposal)
  end
    
  it "should be a speaker" do
    @attendant.speaker?.should == true
  end
end

describe "An attendant with a not accepted proposal" do
  
  it "should be an attendant???"
    
  end