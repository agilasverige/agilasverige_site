class ConfirmationMailer < Merb::MailController

  def confirm
    @attendant = params[:attendant]
    @speaking_proposal = params[:speaking_proposal]
    render_mail
  end

  def notify
    @attendant = params[:attendant]
    @speaking_proposal = params[:speaking_proposal]
    render_mail
  end

end
