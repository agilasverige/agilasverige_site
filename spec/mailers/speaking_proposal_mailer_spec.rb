#coding: utf-8
require "spec_helper"

describe SpeakingProposalMailer do

  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include ActionController::UrlWriter

  before :each do
    @user = User.make!
    @speaking_proposal = SpeakingProposal.make!
    @user.speaking_proposals << @speaking_proposal
    @user.save!

    @email = SpeakingProposalMailer.thanks_for_submission(@user, @speaking_proposal)
  end

  subject {@email}

  it { should deliver_to @user.email }
  it { should have_subject 'Tack för din blixttalsanmälan' }
  it { should have_body_text /#{@speaking_proposal.title}/ }
  it { should have_body_text /#{current_user_url}/ }
  it { should have_body_text /Agila Sverige 2011/ }

end
