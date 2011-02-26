# coding: utf-8
class SpeakingProposalsController < InheritedResources::Base

  before_filter :authenticate_user!, :except => :show
  
  belongs_to :user, :optional => true

  def new
    @user = current_user
    @speaking_proposal = SpeakingProposal.new
  end

  def create
    create! do |success, failure|
      success.html do
        flash[:notice] = "Tack för din blixttalsanmälan, vi har skickat ett e-brev som bekräftar din anmälan"
        SpeakingProposalMailer.thanks_for_submission(current_user, @speaking_proposal).deliver
        redirect_to speaking_proposal_path(@speaking_proposal)
      end
    end
  end

end
