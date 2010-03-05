class ConfirmationEmail < EmailMessage

  FROM = 'registrar@agilasverige.se'
  SUBJECT = 'Tack för din anmälan till Agila Sverige 2009'

  def initialize(attendant)
    @attendant = attendant
    self.to = @attendant.email
    self.from = FROM 
    self.subject = SUBJECT
    super()
  end

  def body
    temp_body = salutation + info 
    temp_body
  end

  def salutation
    " Hej #{@attendant.first_name},  tack för din anmälan till Agila Sverige 2010!"
  end

  def info
    "Du kan editera dina uppgifter samt anmäla blixttal via din personliga url:

    http://agilasverige.se/attendants/#{@attendant.uid}"
  end


end
