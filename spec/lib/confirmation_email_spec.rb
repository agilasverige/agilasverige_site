require 'spec'
require File.join(File.dirname(__FILE__),'..','spec_helper')

describe ConfirmationEmail do

  describe 'an email to an attendant' do

    before :each do
      @attendant = Attendant.new
      @attendant.first_name = 'Attendant'
      @attendant.last_name = 'Attendantsson'
      @attendant.email = 'attendant@localhost.com'
      @attendant.invoice_date = '2008-12-01'
      @attendant.invoice_no = 1212
      @email = ConfirmationEmail.new(@attendant)
    end

    it 'should have name info' do
      
      @email.body.should match(/Attendant Attendantsson/) 
    end

  end
end
