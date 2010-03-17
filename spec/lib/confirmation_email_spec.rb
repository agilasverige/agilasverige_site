require 'spec'
require File.join(File.dirname(__FILE__),'..','spec_helper')

describe ConfirmationEmail do

  describe 'an email to an attendant' do

    before :each do
      @attendant = Attendant.new
      @attendant.first_name = 'Attendant'
      @attendant.last_name = 'Attendantsson'
      @attendant.email = 'attendant@localhost.com'
      @email = ConfirmationEmail.new(@attendant)
    end

    it 'should be sent to attendant' do
      @email.to.should == 'attendant@localhost.com'
    end

    it 'should be sent from registrar' do
      @email.from.should == 'registrar@agilasverige.se'
    end

    it 'should have name info' do
      @email.body.should match(/Attendant/) 
    end
  end

  describe 'an email to an speaker' do

    before :each do
      @speaker = Attendant.new
      @speaker.first_name = 'Speaker'
      @speaker.last_name = 'Speakersson'
      @speaker.email = 'speaker@localhost.com'

      @speaking_proposal = SpeakingProposal.new
      @speaking_proposal.title = 'En titel'
      @speaking_proposal.abstract = 'An abstract'


      @email = SpeakerConfirmationEmail.new(@speaker, @speaking_proposal)
    end

    it 'should be sent to speaker' do
      @email.to.should == 'speaker@localhost.com'
    end

    it 'should be sent from registrar' do
      @email.from.should == 'registrar@agilasverige.se'
    end
    
    it 'should have name info' do
      @email.body.should match(/Speaker/) 
    end


    it 'should have any speaker information' do
      
      @email.body.should match(/förslag på blixttal/)
    end

    it 'should show title' do
      @email.body.should match(/En titel/)
    end

  end
end
