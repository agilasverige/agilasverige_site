class Controller < Ramaze::Controller

  def name
    self.class.to_s.gsub(/Controller/, '').downcase
  end

  def error
    show404
  end

  protected

  def show404
    respond 'Page not found', 404
  end
  
end

# Here go your requires for subclasses of Controller:
require File.join(File.dirname(__FILE__),'main')
require File.join(File.dirname(__FILE__),'css')
require File.join(File.dirname(__FILE__),'as2008')
require File.join(File.dirname(__FILE__),'attendant')
require File.join(File.dirname(__FILE__),'admin')
require File.join(File.dirname(__FILE__),'program')
