class AttendantController < Controller

  def index(uid)
    attendant = ''
    attendant = Attendant.find_by_uid(uid)
    Ramaze::Log.debug("Attendant: #{attendant.inspect}")
    unless(attendant)
      show404
    end
    view = AttendantView::Edit.new(:controller => self, :attendant => attendant)
    view.to_s
  end

  def new
    if request.get?
      AttendantView::New.new(:controller => self).to_s
    elsif request.post?
      Ramaze::Log.debug(request.params)
      sanitize_request
      attendant = Attendant.create(request.params)
      Ramaze::Log.debug(attendant)
      begin
        if attendant.save
          send_confirmation_email(attendant)
          redirect("/attendant/thankyou/#{attendant.uid}")
        else
          flash[:error] = attendant.errors 
          redirect('/attendant/new')
        end
      rescue Exception => e
         flash[:error] = ["Ett tekniskt fel har inträffat. Var vänlig försök senare #{e}"]
         Ramaze::Log.error e
         redirect('/attendant/new')
       end
    end
  end

  def edit(id)
    require_login
    attendant = Attendant.get(id)
    AttendantView::Edit.new(:controller => self, :attendant => attendant)
  end


  def update
    require_login
    if request.post?
      attendant = Attendant.get(request.params['id'])
      set_fields(attendant)
      if attendant.save
        redirect("/attendant/#{attendant.id}")
      else
        flash[:error] = attendant.errors 
        redirect("/attendant/edit/#{attendant.id}")
      end
    end
  end

  def thankyou(uid)
    attendant = Attendant.find_by_uid(uid)
    AttendantView::Show.new(:controller => self, :attendant => attendant, :message => :thanks).to_s
  end


  protected

  def sanitize_request
    checkbox("attending_dinner")
  end

  def checkbox( param )
    request.params[param] = request.params.has_key?(param.to_s)
  end

  def send_confirmation_email(attendant)
    email = ConfirmationEmail.new(attendant)
    email_sender = EmailSender.new
    email_sender.send(email)
  end


  
end
