class SpeakingProposals < Ramaze::Controller
  
  # before :get_attendant
  # before :authenticate
  def index
    @speaking_proposals = @attendant ? @attendant.speaking_proposals : SpeakingProposal.all
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
  
  def authenticate
    basic_authentication { |u, p| Digest::SHA1.hexdigest(p) == "633f55e2df0c9cb68e634c465715476adc559c0e" }
  end

end
