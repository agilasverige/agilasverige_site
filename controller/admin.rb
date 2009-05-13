class AdminController < Controller

  helper :httpdigest
  helper :aspect

  before_all do
    @username = httpdigest('secret area', 'AS09')
  end
  
  def index
  end

  def attendants
    all = Attendant.by_email
    AdminView::Attendants.new(self, all).to_s
  end

  def speaking_proposals
  end

  protected

  def httpdigest_lookup_password(username)
    return "496d8108d4610f62c6cd8a27627e042a" if username == "as09admin"
  end
  
end
