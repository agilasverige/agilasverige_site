class ConfirmationEmail 

  attr_accessor :from, :to, :body, :subject

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

    http://agilasverige.se/attendants/#{@attendant.uid}"
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
