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

    it 'should be sent to attendant' do
      @email.to.should == 'attendant@localhost.com'
    end

    it 'should be sent from registrar' do
      @email.from.should == 'registrar@agilasverige.se'
    end

    it 'should have name info' do
      @email.body.should match(/Attendant Attendantsson/) 
    end

    it 'should have price' do
      @email.body.should match(/SEK 1000/)
    end

    it 'should have VAT price' do
      @email.body.should match(/SEK 250/)
    end

    it 'should have total price' do
      @email.body.should match(/SEK 750/)
    end

    it 'should have organizational number' do
      @email.body.should match(/802404-7879/)
    end

    it 'should have bank giro info' do
      @email.body.should match(/280-9267/)
    end

    it 'should have invoice date' do
      @email.body.should match(/2008-12-01/)
    end

    it 'should have invoice number' do
      @email.body.should match(/1212/)
    end

    it 'should not have any speaker information' do
      @email.body.should_not match(/Förslag till blixttal:/)
    end
  end

  describe 'an email to an speaker' do

    before :each do
      @speaker = Attendant.new
      @speaker.first_name = 'Speaker'
      @speaker.last_name = 'Speakersson'
      @speaker.email = 'speaker@localhost.com'
      @speaker.invoice_date = '2008-12-01'
      @speaker.invoice_no = 1212
      @speaker.speaker = true

      @speaking_proposal = SpeakingProposal.new
      @speaking_proposal.title = 'En titel'
      @speaking_proposal.abstract = 'An abstract'

      @speaker.speaking_proposal = @speaking_proposal

      @email = ConfirmationEmail.new(@speaker)
    end

    it 'should be sent to speaker' do
      @email.to.should == 'speaker@localhost.com'
    end

    it 'should be sent from registrar' do
      @email.from.should == 'registrar@agilasverige.se'
    end
    
    it 'should have name info' do
      @email.body.should match(/Speaker Speakersson/) 
    end

    it 'should not have price' do
      @email.body.should_not match(/SEK 500/)
    end

    it 'should not have invoice date' do
      @email.body.should_not match(/2008-12-01/)
    end

    it 'should not have invoice number' do
      @email.body.should_not match(/1212/)
    end

    it 'should have any speaker information' do
      @email.body.should match(/Förslag till blixttal:/)
    end

    it 'should show title' do
      @email.body.should match(/En titel/)
    end

    it 'should show abstract' do
      @email.body.should match(/An abstract/)
    end
  end
end
