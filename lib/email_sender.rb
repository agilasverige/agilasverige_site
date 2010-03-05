require 'pony'

class EmailSender 

  def send(email_message)
    Pony.mail(:to => email_message.to, 
              :from => email_message.from,
              :subject => email_message.subject, 
              :body => email_message.body)
  end
end
