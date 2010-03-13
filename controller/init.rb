class Controller < Ramaze::Controller

  helper :httpdigest

  def name
    self.class.to_s.gsub(/Controller/, '').downcase
  end

  def error
    show404
  end

  protected

  def require_login
    @username = httpdigest('secret area', 'AS10')
  end

  def httpdigest_lookup_password(username)
    return "10cd1e56a6310fbaeca29f3d64f4b1f5" if username == "thedude"
  end

  def show404
    respond 'Page not found', 404
  end
  
end

# Here go your requires for subclasses of Controller:
require File.join(File.dirname(__FILE__),'main')
require File.join(File.dirname(__FILE__),'css')
require File.join(File.dirname(__FILE__),'previous_conferences')
require File.join(File.dirname(__FILE__),'attendant')
require File.join(File.dirname(__FILE__),'admin')
require File.join(File.dirname(__FILE__),'program')
require File.join(File.dirname(__FILE__),'speaking_proposal')
