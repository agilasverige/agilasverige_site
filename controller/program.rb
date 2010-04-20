class ProgramController < Controller

  def index
    speaking_proposals = SpeakingProposal.all
    schedule = Schedule.new
    ProgramView::Index.new(:controller => self, :schedule => schedule, :sessions => speaking_proposals).to_s
  end
end

