class ProgramController < Controller

  def index
    speakers = Attendant.speakers_by_lastname
    schedule = Schedule.new
    ProgramView::Index.new(self, schedule, speakers).to_s
  end
end

