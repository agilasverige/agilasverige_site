class AttendantController < Controller

  def index(uid, action='')
    Ramaze::Log.debug("Action: #{action}")
    attendant = Attendant.find_by_uid(uid)
    Ramaze::Log.debug("Attendant: #{attendant.inspect}")
    unless(attendant)
      show404
    end
    if request.post?
      if attendant.update_attributes!(sanitized_request)
        redirect("/attendant/#{attendant.uid}")
      else
        flash[:error] = attendant.errors 
        redirect("/attendant/#{attendant.uid}/edit")
      end
    elsif action == 'edit'
      view = AttendantView::Edit.new(:controller => self, :attendant => attendant)
    else
      Ramaze::Log.debug("not edit: #{action.inspect}")
      view = AttendantView::Show.new(:controller => self, :attendant => attendant)
    end
    view.to_s
  end

  def new
    if request.get?
      AttendantView::New.new(:controller => self).to_s
    elsif request.post?
      Ramaze::Log.debug(request.params.inspect)
      attendant = Attendant.create(sanitized_request)
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

  def thankyou(uid)
    attendant = Attendant.find_by_uid(uid)
    AttendantView::Show.new(:controller => self, :attendant => attendant, :message => :thanks).to_s
  end


  protected

  def sanitized_request
    tmp_req = request.params.clone
    Ramaze::Log.debug('tmp ' + tmp_req.inspect)
    tmp_req['attending_dinner'] = checkbox("attending_dinner")
    Ramaze::Log.debug('sanitized_requesttmp ' + tmp_req.inspect)
    tmp_req
  end

  def checkbox( param )
    request[param.to_s] == param.to_s
  end

  def send_confirmation_email(attendant)
    email = ConfirmationEmail.new(attendant).send
  end


  
end
