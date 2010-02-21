require File.join(File.dirname(__FILE__),'..','spec_helper')

describe EmailMessage do

  describe 'a new mail message' do
    before :each do
      @mail = EmailMessage.new
    end

    it 'should have a from address' do
      @mail.from = "from@localhost"
      @mail.from.should == "from@localhost"
    end

    it 'should have a to address' do
      @mail.to = 'to@localhost'
      @mail.to.should == 'to@localhost'
    end

    it 'should have a body' do
      @mail.body = 'this is a body'
      @mail.body.should == 'this is a body'
    end

    it 'should have a subject' do
      @mail.subject = 'subject'
      @mail.subject.should == 'subject'
    end

    it 'should have a default port = 25' do
      @mail.port.should == 25
    end
  
  end

end
