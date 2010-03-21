require 'pony'

class BaseEmail

  attr_accessor :from, :to, :body, :subject

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
      Pony.mail(:to => @to, :from => @from, :subject => @subject, :body => @body)
    else
      @@sent_emails << self
    end
  end

end

class MassEmail < BaseEmail
    
  def initialize(body)
    @body = body
    self.from = 'info@agilasverige.se'
    self.to = all_attendants
  end

  def all_attendants
    addresses = Attendant.all.inject('') { |emails, attendant| emails + attendant.email + ', ' }
    addresses << 'as-xx@googlegroups.com'
  end

end

class ConfirmationEmail < BaseEmail

  FROM = 'registrar@agilasverige.se'
  SUBJECT = 'Tack för din anmälan till Agila Sverige 2009'

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


