class AttendantController < Ramaze::Controller

  def index(id, message = '')
    attendant = Attendant.get(id)
    view = AttendantView::Show.new
    view.message = message
    view.attendant = attendant
    view.to_s
  end

  def new
    if request.get?
      AttendantView::New.new.to_s
    elsif request.post?
      sanitize_request
      attendant = Attendant.new(request.params)
      attendant.save
      send_confirmation_email(attendant)
      redirect("/attendant/#{attendant.id}/thanks")
    end
  end

  def sanitize_request
    checkbox("attending_dinner")
  end

  protected

  def checkbox( param )
    request.params[param] = request.params.has_key?(param.to_s)
  end

  def send_confirmation_email(attendant)
    ConfirmationMailer.send_message_to(attendant)
  end

  
end
