class Program < Application
  
  def index
    @schedule = Schedule.new
    render
  end
  
end
