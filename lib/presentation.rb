class Presentation
  attr_accessor :title, :author
  attr_reader :files

  def initialize
    @files = []
  end

end
