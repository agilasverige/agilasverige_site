require 'spec_helper'

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
    attendant
  end
      
end
