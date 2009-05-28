class ProgramController < Controller

  def index
    speakers = Attendant.speakers_by_lastname
    schedule = Schedule.new
    ProgramView::Index.new(:controller => self, :schedule => schedule, :speakers => speakers).to_s
  end
end

