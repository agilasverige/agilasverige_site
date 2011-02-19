class SpeakingProposalsController < InheritedResources::Base

  belongs_to :user, :optional => true

  def new
    @user = current_user
    @speaking_proposal = SpeakingProposal.new
  end
end
