class MainController < Controller

  def index
    MainView::Index.new(:controller => self).to_s
  end
  

end
