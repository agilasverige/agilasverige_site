class AdminController < Controller

  helper :httpdigest
  helper :aspect

  before_all do
    @username = httpdigest('secret area', 'AS|09')
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
    return "fa7cf5745856dd69cd7f1b508e2a759f" if username == "as09admin"
  end
  
end
