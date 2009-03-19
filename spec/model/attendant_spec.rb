require File.join(File.dirname(__FILE__),'..','..','model','attendant')

describe Attendant do
  before(:each) do
    @all_args = {:first_name => 'first',
                 :last_name => 'last',
                 :organization => 'organization',
                 :address => 'adress',
                 :postal_address => '12345'}
  end
                 
  describe 'Created without first name' do
     it 'should raise argument error' do
       lambda{Attendant.new({})}.should raise_error(ArgumentError, "Förnamn, efternamn, adress, postnummer och postadress är obligatoriska fält")
     end
  end

  describe 'Created with mandatory arguments' do
    it 'should require a first name' do
    end
  end

end
