require File.join(File.dirname(__FILE__),'..','..','model','attendant')

describe Attendant do
  describe 'Created without mandatory arguments' do
     it 'should raise argument error' do
       #lambda{Attendant.new({})}.should raise_error(ArgumentError, "Förnamn, efternamn, adress, postnummer och postadress är obligatoriska fält")
     end
  end
  describe 'Created with all mandatory argument' do
    it 'should return a new Attendant' do
      mandatory_args = {:first_name => 'name',
                        :last_name => 'last_name',
                        :organization => 'last_name',
                        :address => 'address',
                        :zip_code => 12345,
                        :postal_address => 'postal_address'}

      lambda{Attendant.new(mandatory_args)}.should_not raise_error(ArgumentError)
    end
  end
      
end
