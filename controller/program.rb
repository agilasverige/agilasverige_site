class ProgramController < Controller

  def index
    speakers = Attendant.all
    schedule = Schedule.new
    ProgramView::Index.new(:controller => self, :schedule => schedule, :speakers => speakers).to_s
  end
end

