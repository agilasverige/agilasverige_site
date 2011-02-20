class SpeakingProposalMailer < ActionMailer::Base
  default :from => "info@agilasverige.se"

  def thanks_for_submission(user, speaking_proposal)
    mail(:to => user.email)
  end
end
