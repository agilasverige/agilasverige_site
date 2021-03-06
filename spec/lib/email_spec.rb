# coding: utf-8
require File.join(File.dirname(__FILE__),'..','spec_helper')

describe BaseEmail do

  it 'should have a testing mode' do
    BaseEmail.testing
    BaseEmail.sent_emails.should be_empty
  end

  describe 'in testing mode' do

    it 'should have sent emails in a sent box' do
      BaseEmail.testing
      
      message = BaseEmail.new
      message.from = 'test@test.com'
      message.to = 'to@test.com'
      message.subject = 'Test Subject'
      message.body = 'body'
      message.send
      BaseEmail.sent_emails.should include message
    end
  end

  describe 'a new mail message' do
    before :each do
      @mail = BaseEmail.new
    end

    it 'should have a from address' do
      @mail.from = "from@localhost"
      @mail.from.should == "from@localhost"
    end

    it 'should have a to address' do
      @mail.to = 'to@localhost'
      @mail.to.should == 'to@localhost'
    end

    it 'should have a bcc address' do
      @mail.bcc = 'bcc@localhost.com'
      @mail.bcc.should == 'bcc@localhost.com'
    end

    it 'should have a body' do
      @mail.body = 'this is a body'
      @mail.body.should == 'this is a body'
    end

    it 'should have a subject' do
      @mail.subject = 'subject'
      @mail.subject.should == 'subject'
    end

  end

end

describe ConfirmationEmail do

  describe 'an email to an user' do

    before :each do
      @user = User.new
      @user.first_name = 'user'
      @user.last_name = 'usersson'
      @user.email = 'user@localhost.com'
      @email = ConfirmationEmail.new(@user)
    end

    it 'should be sent to user' do
      @email.to.should == 'user@localhost.com'
    end

    it 'should be sent from registrar' do
      @email.from.should == 'registrar@agilasverige.se'
    end

    it 'should have name info' do
      @email.body.should match(/user/) 
    end

  end

  describe 'an email to an speaker' do

    before :each do
      @speaker = User.new
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

#describe 'a mass email' do

#  it 'should have addresses as an array' do
#    user.delete_all
#    user = Factory(:user)
#    lars = Factory(:lars)
#    email = MassEmail.new('subject', 'bodybodybody')
#    email.all_users.sort.should == [lars.email, user.email, 'as-xx@googlegroups.com'].sort
#  end
#end
    

