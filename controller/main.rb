class MainController < Ramaze::Controller

  # engine :Haml
  # layout '/layout'
  
  # deny_layout :sponsors

  def index
    MainView.new.to_s
  end
  
  def thanks
  end
  
  def program
    @schedule = SpeakerSchedule.new
    ProgramView.new.to_s
  end

  def sponsors
  end

  def talkinfo
    @talkinfo = {:day => request[:day],
                 :track => request[:track],
                 :slot => request[:slot],
                 :talk => request[:talk]}
    
  end

end
