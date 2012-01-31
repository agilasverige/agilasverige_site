# coding: utf-8
class SpeakingProposalsController < InheritedResources::Base

  before_filter :authenticate_user!
  
  belongs_to :user, :optional => true

  def index
    @proposals=SpeakingProposal.list
    render :layout => 'admin'
  end

  def new
    @user = current_user
    @speaking_proposal = SpeakingProposal.new
  end

  def create
    create! do |success, failure|

      @speaking_proposal.speakers << current_user

      success.html do
        flash[:notice] = "Tack för din blixttalsanmälan, vi har skickat ett e-brev som bekräftar din anmälan"
        SpeakingProposalMailer.thanks_for_submission(current_user, @speaking_proposal).deliver
        redirect_to speaking_proposal_path(@speaking_proposal)
      end
    end
  end

  def edit
    @speaking_proposal = SpeakingProposal.find(params[:id])
    unless @speaking_proposal.speakers.include?(current_user)
      render :file => 'public/404.html', :status_code => 404
    end
  end

end
