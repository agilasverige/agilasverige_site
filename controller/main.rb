class MainController < Ramaze::Controller

  engine :Haml
  layout '/layout'
  
  deny_layout :sponsors
  def index
  end
  
  def thanks
  end
  
  def program
  end

  def sponsors
  end
end
