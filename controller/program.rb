class ProgramController < Controller

  def index
    ProgramView::Index.new(self).to_s
  end
end

