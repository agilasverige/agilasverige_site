class SpeakingProposalController < Controller

  def index(id, action='')
    speaking_proposal = SpeakingProposal.find(id)
    if request.post?
      if request[:file]
        tempfile = request[:file].delete(:tempfile)
        filename = request[:file].delete(:filename)
        extension = File.extname filename
        filename = speaking_proposal.base_file_name + extension
        FileUtils.cp(tempfile.path, "public/files/presentations10/#{filename}")
        FileUtils.chmod(0644, "public/files/presentations10/#{filename}")
        speaking_proposal.filename = filename
      end
      if speaking_proposal.update_attributes(request.params)
        redirect("/speaking_proposal/#{id}")
      else
        flash[:error] = speaking_proposal.errors 
        redirect("/speaking_proposal/edit/#{speaking_proposal.id}")
      end
    end
    unless(speaking_proposal)
      show404
    end
    if(action == 'edit')
      view = SpeakingProposalView::Edit.new(:controller => self, :speaking_proposal => speaking_proposal)
    else
      view = SpeakingProposalView::Show.new(:controller => self, :speaking_proposal => speaking_proposal)
    end
    view.to_s
  end

  def new
    if request.get?
      uid = request['uid'] || show_cannot_find_user
      view = SpeakingProposalView::New.new(:controller => self, :user_uid => uid)
      view.to_s
    elsif request.post?
      begin
        user_uid = request.params.delete('user_uid') || show_cannot_find_user
        user = user.find_by_uid(user_uid)
        speaking_proposal = user.speaking_proposals.create(request.params)
        if user.save
          send_confirmation_email(user, speaking_proposal)
          redirect("/speaking_proposal/thankyou/#{speaking_proposal.id}")
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
    speaking_proposal = SpeakingProposal.find(title)
    SpeakingProposalView::Show.new(:controller => self, :speaking_proposal => speaking_proposal, :message => :thanks).to_s
  end



  protected

  def send_confirmation_email(user, speaking_proposal)
    SpeakerConfirmationEmail.new(user, speaking_proposal).send
  end


  def show_cannot_find_user
    flash[:error] = 'Kan inte hitta den deltagaren'
    show404
  end
  
  
end
