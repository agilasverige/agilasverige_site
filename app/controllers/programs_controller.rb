class ProgramController < ApplicationController

  def index
    if Date.today.to_s == '2010-05-11'
      redirect '/program/tuesday'
    else
      redirect '/program/monday'
    end
  end

  def monday
    speaking_proposals = SpeakingProposal.all
    schedule = Schedule.new
    ProgramView::Monday.new(:controller => self, :schedule => schedule, :sessions => speaking_proposals).to_s
  end

  def tuesday
    speaking_proposals = SpeakingProposal.all
    schedule = Schedule.new
    ProgramView::Tuesday.new(:controller => self, :schedule => schedule, :sessions => speaking_proposals).to_s
  end
end

