class MainController < Controller

  def index
    MainView::Index.new(self).to_s
  end
  
  

end
