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
    @username = httpdigest('secret area', 'AS09')
  end

  def httpdigest_lookup_password(username)
    return "496d8108d4610f62c6cd8a27627e042a" if username == "as09admin"
  end

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
