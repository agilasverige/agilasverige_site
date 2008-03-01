require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Attendant do

  before :each do
    @attendant = Attendant.new
  end

  it "should have first name" do
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
  
  

end