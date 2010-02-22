class AttendantController < Controller

  def index(id, message = '')
    attendant = ''
    begin
      attendant = Attendant.get(id)
    rescue
      show404
    end
    view = AttendantView::Show.new(:controller => self)
    view.message = message
    view.attendant = attendant
    view.to_s
  end

  def new
    if request.get?
      AttendantView::New.new(:controller => self).to_s
    elsif request.post?
      sanitize_request
      attendant = set_fields(Attendant.new)
      # begin
        if attendant.save
          # send_confirmation_email(attendant)
          redirect("/attendant/#{attendant.id}/thanks")
        else
          flash[:error] = attendant.errors 
          redirect('/attendant/new')
        end
      # rescue Exception => e
      #   flash[:error] = ["Ett tekniskt fel har inträffat. Var vänlig försök senare #{e}"]
      #   redirect('/attendant/new')
      # end
    end
  end

  def edit(id)
    require_login
    attendant = Attendant.get(id)
    AttendantView::Edit.new(:controller => self, :attendant => attendant)
  end


  def update
    require_login
    puts 'hej'
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


  protected

  def sanitize_request
    checkbox("attending_dinner")
  end

  def checkbox( param )
    request.params[param] = request.params.has_key?(param.to_s)
  end

  def send_confirmation_email(attendant)
    email = ConfirmationEmail.new(attendant)
    email.send
  end

  def set_fields(attendant)
    attendant.first_name = request.params['first_name'] 
    attendant.last_name = request.params['last_name'] 
    attendant.organization = request.params['organization']
    attendant.address = request.params['address']
    attendant.zip_code = request.params['zip_code']
    attendant.postal_address = request.params['postal_address']
    attendant.country = request.params['country']
    attendant.telephone_number = request.params['telephone_number']
    attendant.attending_dinner = request.params['attending_dinner']
    attendant.food_preferences = request.params['food_preferences']
    attendant.comments = request.params['comments']
    attendant.email = request.params['email'] 
    if request.params['wants_to_speak']
      speaking_proposal = SpeakingProposal.new
      speaking_proposal.title = request.params['title']
      speaking_proposal.abstract = request.params['abstract']
      attendant.speaking_proposal = speaking_proposal
    end
    attendant
  end

  
end
