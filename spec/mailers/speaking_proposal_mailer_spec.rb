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

    @email = SpeakingProposalMailer.create_thanks_for_submission(@user, @speaking_proposal)
  end

  subject {@email}

  it {should deliver_to @user.email}

end
