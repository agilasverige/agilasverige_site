class SpeakingProposalController < Controller

  def index(title)
    speaking_proposal = ''
    speaking_proposal = SpeakingProposal.find_by_snake_title
    Ramaze::Log.debug("SpeakingProposal: #{speaking_proposal.inspect}")
    unless(speaking_proposal)
      show404
    end
    view = SpeakingProposalView::Edit.new(:controller => self, :speaking_proposal => speaking_proposal)
    view.to_s
  end

  def new
    if request.get?
      SpeakingProposalView::New.new(:controller => self).to_s
    elsif request.post?
      begin
        speaking_proposal = SpeakingProposal.new(request.params)
        if speaking_proposal.save
          # send_confirmation_email(speaking_proposal)
          redirect("/speaking_proposal/#{speaking_proposal.snake_title}/thanks")
        else
          flash[:error] = speaking_proposal.errors 
          redirect('/speaking_proposal/new')
        end
      rescue Exception => e
         flash[:error] = ["Ett tekniskt fel har inträffat. Var vänlig försök senare #{e}"]
         Ramaze::Log.error e
         redirect('/speaking_proposal/new')
       end
    end
  end

  def edit(id)
    speaking_proposal = SpeakingProposal.get(id)
    SpeakingProposalView::Edit.new(:controller => self, :speaking_proposal => speaking_proposal)
  end


  def update
    require_login
    if request.post?
      speaking_proposal = SpeakingProposal.get(request.params['id'])
      set_fields(speaking_proposal)
      if speaking_proposal.save
        redirect("/speaking_proposal/#{speaking_proposal.id}")
      else
        flash[:error] = speaking_proposal.errors 
        redirect("/speaking_proposal/edit/#{speaking_proposal.id}")
      end
    end
  end


  protected

  def send_confirmation_email(speaking_proposal)
    email = ConfirmationEmail.new(speaking_proposal)
    email_sender = EmailSender.new
    email_sender.send(email)
  end

  def set_fields(speaking_proposal)
    speaking_proposal.first_name = request.params['first_name'] 
    speaking_proposal.last_name = request.params['last_name'] 
    speaking_proposal.organization = request.params['organization']
    speaking_proposal.address = request.params['address']
    speaking_proposal.zip_code = request.params['zip_code']
    speaking_proposal.postal_address = request.params['postal_address']
    speaking_proposal.country = request.params['country']
    speaking_proposal.telephone_number = request.params['telephone_number']
    speaking_proposal.attending_dinner = request.params['attending_dinner']
    speaking_proposal.food_preferences = request.params['food_preferences']
    speaking_proposal.comments = request.params['comments']
    speaking_proposal.email = request.params['email'] 
    if request.params['wants_to_speak']
      speaking_proposal = SpeakingProposal.new
      speaking_proposal.title = request.params['title']
      speaking_proposal.abstract = request.params['abstract']
      speaking_proposal.speaking_proposal = speaking_proposal
    end
    speaking_proposal
  end

  
end
