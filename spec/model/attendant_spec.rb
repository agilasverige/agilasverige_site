require File.join(File.dirname(__FILE__),'..','..','model','attendant')

describe Attendant do
  describe 'Created without mandatory arguments' do
     it 'should raise argument error' do
       #lambda{Attendant.new({})}.should raise_error(ArgumentError, "Förnamn, efternamn, adress, postnummer och postadress är obligatoriska fält")
     end
  end
  describe 'Created with all mandatory argument' do

    before(:each) do
      Attendant.by_email(:key => 'attendant@localhost.com').each do |attendant|
        attendant.destroy
      end
    end

    it 'should require a unique email address' do
      create_attendant
      lambda{create_attendant}.should raise_error(ArgumentError)
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
    attendant.save
  end
      
end
