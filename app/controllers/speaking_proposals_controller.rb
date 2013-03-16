# coding: utf-8
class SpeakingProposalsController < InheritedResources::Base

  before_filter :authenticate_user!

  belongs_to :user, :optional => true

  def index
    @proposals=SpeakingProposal.list.for_current_conference
    render :layout => 'admin'
  end

  def new
    @user = current_user
    @speaking_proposal = SpeakingProposal.new
  end

  def create
    create! do |success, failure|

      registration = Registration.create!(user_id: current_user.id, conference_id: Conference.current.id)
      @speaking_proposal.registration = registration
      @speaking_proposal.save

      success.html do
        flash[:notice] = "Tack för din blixttalsanmälan, vi har skickat ett e-brev som bekräftar din anmälan"
        SpeakingProposalMailer.thanks_for_submission(current_user, @speaking_proposal).deliver
        redirect_to user_path(current_user)
      end
      failure.html do
        flash[:error] = "Kunde ej spara talarförslag"
        redirect_to user_path(current_user)
      end
    end
  end

  def edit
    @speaking_proposal = SpeakingProposal.find(params[:id])
    unless @speaking_proposal.speakers.include?(current_user)
      render :file => 'public/404.html', :status_code => 404
    end
  end

  def upload_presentation
    speaking_proposal = SpeakingProposal.find(params[:id])
    speaking_proposal.presentation = params[:file]
    speaking_proposal.save!
    redirect_to speaking_proposal_path(@speaking_proposal)
  end

  def schedule
    unless current_user && current_user.admin?
      render '/public/404.html', :status => 404
    else
      @speaking_proposal = SpeakingProposal.find(params[:id])
      @speaking_proposal.update_attributes!(params[:speaking_proposal])
      redirect_to speaking_proposal_path(@speaking_proposal)
    end
  end
end
