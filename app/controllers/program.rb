class Program < Application
  
  def index
    @schedule = SpeakerSchedule.new
    render
  end
  
end
