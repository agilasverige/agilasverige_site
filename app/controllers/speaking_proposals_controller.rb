# coding: utf-8
class SpeakingProposalsController < InheritedResources::Base

  belongs_to :user, :optional => true

  def new
    @user = current_user
    @speaking_proposal = SpeakingProposal.new
  end

  def create
    create!(:notice => "Tack för din blixttalsanmälan, vi har skickat ett e-brev som bekräftar din anmälan")
  end
end
