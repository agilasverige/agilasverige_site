require File.join(File.dirname(__FILE__),'..','..','model','attendant')

describe Attendant do
  describe 'Without mandatory arguments' do
    before(:each) do
      @attendant = Attendant.new
    end

    it 'should not be saveable' do

      saveable = @attendant.save
      saveable.should == false

    end
  end
  describe 'Created with all mandatory argument' do

    before(:each) do
      Attendant.by_email(:key => 'attendant@localhost.com').each do |attendant|
        attendant.destroy
      end
      @attendant = create_attendant
    end

    it 'should be saveable' do
      @attendant.save.should == true
    end



  end

  def create_attendant
    attendant = Attendant.new
    attendant.first_name = 'Attendant'
    attendant.last_name = 'Attendantsson'
    attendant.organization = 'Organization'
    attendant.email = 'attendant@localhost.com'
    attendant.address = 'address'
    attendant.zip_code = '12345'
    attendant.postal_address = 'Postal Address'
    attendant.country = 'Country'
    attendant
  end
      
end
