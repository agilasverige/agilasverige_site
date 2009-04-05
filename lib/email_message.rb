require 'tmail'
require 'net/smtp'

class EmailMessage


  attr_accessor :from, :to, :body, :subject, :port


  def initialize(attendant=nil)
    setup_defaults
    @to = attendant.email if attendant
  end

  def send
    @message.to = to
    @message.from = from
    @message.subject = subject
    @message.body = body
    @message.date = Time.now

    Net::SMTP.start( 'localhost', port ) do|smtpclient|
      smtpclient.send_message(
        @message.to_s,
        @message.from,
        @message.to
      )
    end
  end

  private 

  def setup_defaults
    @port = 25
    @message = TMail::Mail.new
  end
  

end
