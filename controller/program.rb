class ProgramController < Ramaze::Controller

  #cache_page :index
  
  def index
    @schedule = SpeakerSchedule.new
    render
  end
  
end
