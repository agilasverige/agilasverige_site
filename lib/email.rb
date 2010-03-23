require 'mail'

class BaseEmail

  attr_accessor :from, :to, :bcc, :body, :subject

  @@testing = false

  def self.testing
    @@testing = true
    @@sent_emails = []
  end

  def self.sent_emails
    @@sent_emails
  end

  def send
    unless @@testing 
      email = Mail.new
      email.to to 
      email.bcc bcc
      email.from from 
      email.subject subject 
      email.body body
      set_delivery_method(email)
      email.deliver
    else
      @@sent_emails << self
    end
  end

  private

  def set_delivery_method(email)
    sendmail_binary = `which sendmail`.chomp
    if File.executable? sendmail_binary
      email.delivery_method :sendmail, :location => sendmail_binary
    else
      email.delivery_method :smtp
    end
  end 
      

end

class MassEmail < BaseEmail
    
  def initialize(subject, body)
    @subject = subject
    @body = body
    self.from = 'info@agilasverige.se'
    self.to = 'info@agilasverige.se'
    self.bcc = all_attendants
  end

  def all_attendants
    addresses = Attendant.all.inject([]) { |emails, attendant| emails << attendant.email}
    addresses << 'as-xx@googlegroups.com'
  end

end

class ConfirmationEmail < BaseEmail

  FROM = 'registrar@agilasverige.se'
  SUBJECT = 'Tack för din anmälan till Agila Sverige 2010'

  def initialize(attendant)
    @attendant = attendant
    self.to = @attendant.email
    self.from = FROM 
    self.subject = SUBJECT
  end

  def body
    salutation + info 
  end

  def salutation
    " Hej #{@attendant.first_name},  tack för din anmälan till Agila Sverige 2010!"
  end

  def info
    "Du kan editera dina uppgifter samt anmäla blixttal via din personliga url:

    http://www.agilasverige.se/attendant/#{@attendant.uid}"
  end
end

class SpeakerConfirmationEmail < ConfirmationEmail

  def initialize(attendant, speaking_proposal)
    @speaking_proposal = speaking_proposal
    super(attendant)
  end

  def salutation
    "Hej #{@attendant.first_name},  tack för din förslag på blixttal \"#{@speaking_proposal.title}\""
  end

  def info
    "Vi kommer att sätta schemat ungefär tre veckor innan konferensen och återkommer då med information om ditt förslag kommit med."
  end
end


