class ZeroEightController < Controller

  map '/2008'

  def index
    presentations08 = Presentations08.new.presentations
    view = AS2008View.new(self, presentations08)
    view.to_s
  end
end
