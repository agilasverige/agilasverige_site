#coding: utf-8
class SpeakingProposalMailer < ActionMailer::Base
  default :from => "info@agilasverige.se"

  def thanks_for_submission(user, speaking_proposal)
    @user = user
    @speaking_proposal = speaking_proposal
    mail(:to => user.email, :subject => 'Tack för din blixttalsanmälan')
  end
end
