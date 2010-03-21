require 'pony'

class BaseEmail

  attr_accessor :from, :to, :body, :subject

  @@testing = false

  def self.testing
    Ramaze::Log.debug "setting email to testing"
    @@testing = true
    @@sent_emails = []
  end

  def self.sent_emails
    @@sent_emails
  end

  def send
    Ramaze::Log.debug "About to send email"
    unless @@testing 
      Pony.mail(:to => @to, :from => @from, :subject => @subject, :body => @body)
    else
      Ramaze::Log.debug "test sending email"
      Ramaze::Log.debug "adding self #{self} to sent emails}"
      @@sent_emails << self
    end
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


