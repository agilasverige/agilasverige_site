require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe Attendant do

  describe 'Without mandatory arguments' do
    before(:each) do
      @attendant = Attendant.new
    end

    it 'should not be saveable' do
      @attendant.valid?.should == false
    end
  end

  describe 'Created with all mandatory argument' do

    before(:each) do
      @attendant = create_attendant
    end

    it 'should be valid' do
      @attendant.valid?.should == true
    end

    it 'should have a uid' do
      @attendant.uid.should_not be_nil
    end

    it 'should have a unique url' do
      @attendant.unique_url.should == "http://www.agilasverige.se/attendant/#{@attendant.uid}"
    end

  end

  def create_attendant
    attendant = Attendant.new
    attendant.first_name = 'Attendant'
    attendant.last_name = 'Attendantsson'
    attendant.organization = 'Organization'
    attendant.email = 'attendant@localhost.com'
    attendant.address = 'address'
    attendant.invoice_reference = 'invoice reference'
    attendant.zip_code = '12345'
    attendant.postal_address = 'Postal Address'
    attendant.country = 'Country'
    attendant.save
    attendant
  end
      
end
