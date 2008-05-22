class Program < Application

  cache_page :index
  
  def index
    @schedule = SpeakerSchedule.new
    render
  end
  
end
