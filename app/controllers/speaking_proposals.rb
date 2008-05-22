class SpeakingProposals < Application
  
  before :get_attendant

  def index
    @speaking_proposals = @attendant.speaking_proposals
    render 
  end

  def new
    @speaking_proposal = SpeakingProposal.new(params)
    render
  end
  
  def create
    @speaking_proposal = @attendant.speaking_proposals.create(params[:speaking_proposal])
    redirect url(:attendant_speaking_proposals, @speaking_proposal)
  end

  def show
    @speaking_proposal = SpeakingProposal.first(params[:id])
    render
  end

  def edit
    @speaking_proposal = SpeakingProposal.first(params[:id])
    render
  end

  def update
    @speaking_proposal = SpeakingProposal.first(params[:id])
    @speaking_proposal.update_attributes(params[:speaking_proposal])
    redirect url(:attendant_speaking_proposals, @speaking_proposal)
  end
  private

  def get_attendant
    @attendant = Attendant.first(:id => params[:attendant_id])
  end
end
