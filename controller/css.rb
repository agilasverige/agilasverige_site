require 'haml'

class CSSController < Controller
  map '/css'
  engine :Sass

  def master
  end
end

