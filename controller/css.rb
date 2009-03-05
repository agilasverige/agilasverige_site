require 'haml'

class CSSController < Ramaze::Controller
  map '/css'
  engine :Sass

  def master
  end
end

