class SpeakingProposals < Application
  
  def index
    @attendant = Attendant.first(:id => params[:attendant_id])
    @speaking_proposals = @attendant.speaking_proposals
    render 
  end

  
end
