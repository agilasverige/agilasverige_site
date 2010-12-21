class UserController < Controller

  def index(uid, action='')
    Ramaze::Log.debug("Action: #{action}")
    user = User.find_by_uid(uid)
    Ramaze::Log.debug("User: #{user.inspect}")
    unless(user)
      show404
    end
    if request.post?
      if user.update_attributes!(sanitized_request)
        redirect("/user/#{user.uid}")
      else
        flash[:error] = user.errors 
        redirect("/user/#{user.uid}/edit")
      end
    elsif action == 'edit'
      view = UserView::Edit.new(:controller => self, :user => user, :admin => (require_login == 'thedude'))
    else
      Ramaze::Log.debug("not edit: #{action.inspect}")
      view = UserView::Show.new(:controller => self, :user => user)
    end
    view.to_s
  end

  def new
    if request.get?
      UserView::New.new(:controller => self).to_s
    elsif request.post?
      Ramaze::Log.debug(request.params.inspect)
      user = User.create(sanitized_request)
      Ramaze::Log.debug(user)
      begin
        if user.save
          send_confirmation_email(user)
          redirect("/user/thankyou/#{user.uid}")
        else
          flash[:error] = user.errors 
          redirect('/user/new')
        end
      rescue Exception => e
         flash[:error] = ["Ett tekniskt fel har inträffat. Var vänlig försök senare #{e}"]
         Ramaze::Log.error e
         redirect('/user/new')
       end
    end
  end

  def thankyou(uid)
    user = User.find_by_uid(uid)
    UserView::Show.new(:controller => self, :user => user, :message => :thanks).to_s
  end


  protected

  def sanitized_request
    tmp_req = request.params.clone
    Ramaze::Log.debug('tmp ' + tmp_req.inspect)
    tmp_req['attending_dinner'] = checkbox("attending_dinner")
    tmp_req['unregistered'] = checkbox("unregistered")
    Ramaze::Log.debug('sanitized_requesttmp ' + tmp_req.inspect)
    tmp_req
  end

  def checkbox( param )
    request[param.to_s] == param.to_s
  end

  def send_confirmation_email(user)
    email = ConfirmationEmail.new(user).send
  end


  
end
