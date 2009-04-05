class ConfirmationMailer

  FROM = 'registrar@agilasverige.se'
  SUBJECT = 'Tack för din anmälan till Agila Sverige 2009'
  BODY = <<END
Hej och tack för din anmälan till Agila Sverige 2008. Vi kommer inom
kort att skicka en faktura till den adress du angivit i anmälan.
END

  def self.send_message_to(attendant)
    message = EmailMessage.new(attendant)
    message.from = FROM 
    message.subject = SUBJECT
    message.body = BODY
    message.send
  end
end
