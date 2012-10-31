class ProgramController < ApplicationController

  def show
    @conference = Conference.current
    @day1 = @conference.speaking_proposals.day1
    @day2 = @conference.speaking_proposals.day2
  end
end

