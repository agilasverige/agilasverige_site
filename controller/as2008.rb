
class AS2008Controller < Ramaze::Controller

  map '/2008'

  def index
    presentations08 = Presentations08.new.presentations
    view = AS2008View.new(presentations08)
    view.to_s
  end
end
