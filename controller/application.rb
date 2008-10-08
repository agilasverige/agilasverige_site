class Application < Merb::Controller
  before :setup

  def setup
    @controller_name = controller_name
  end
end
