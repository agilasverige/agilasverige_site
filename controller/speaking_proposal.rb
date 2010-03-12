class SpeakingProposalController < Controller

  def index(title)
    speaking_proposal = ''
    speaking_proposal = SpeakingProposal.find_by_snake_title
    Ramaze::Log.debug("SpeakingProposal: #{speaking_proposal.inspect}")
    unless(speaking_proposal)
      show404
    end
    view = SpeakingProposalView::Show.new(:controller => self, :speaking_proposal => speaking_proposal)
    view.to_s
  end

  def new
    if request.get?
      uid = request['uid'] || show_cannot_find_user
      view = SpeakingProposalView::New.new(:controller => self, :attendant_uid => uid)
      view.to_s
    elsif request.post?
      begin
        attendant_uid = request.params.delete('attendant_uid') || show_cannot_find_user
        attendant = Attendant.find_by_uid(attendant_uid)
        speaking_proposal = attendant.speaking_proposals.create(request.params)
        if attendant.save
          send_confirmation_email(attendant, speaking_proposal)
          redirect("/speaking_proposal/thankyou/#{speaking_proposal.snake_title}")
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

  def thankyou(title)
    speaking_proposal = SpeakingProposal.find_by_snake_title(title)
    SpeakingProposalView::Show.new(:controller => self, :speaking_proposal => speaking_proposal, :message => :thanks).to_s
  end



  protected

  def send_confirmation_email(attendant, speaking_proposal)
    email = SpeakerConfirmationEmail.new(attendant, speaking_proposal)
    email_sender = EmailSender.new
    email_sender.send(email)
  end


  def show_cannot_find_user
    flash[:error] = 'Kan inte hitta den deltagaren'
    show404
  end
  
  
end
