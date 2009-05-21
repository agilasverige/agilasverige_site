class AdminController < Controller

  helper :httpdigest
  helper :aspect

  # before_all do
  #   @username = httpdigest('secret area', 'AS09')
  # end
  
  def index
  end

  def attendants
    all = Attendant.by_last_name
    AdminView::Attendants.new(self, all).to_s
  end

  def speakers 
    AdminView::Attendants.new(self, only_speakers).to_s
  end

  def dinner_guests 
    AdminView::Attendants.new(self, only_dinner).to_s
  end
  def speaking_proposals
      all = only_speakers 
      AdminView::SpeakingProposals.new(self, all).to_s
  end

  def speaking_proposals_csv
    to_csv(only_speakers)
  end

  protected

  def only_speakers
    all = Attendant.by_last_name
    all.delete_if{|attendant| !attendant.speaker}
  end

  def only_dinner
    all = Attendant.by_last_name
    all.delete_if{|attendant| !attendant.attending_dinner}
  end

  def httpdigest_lookup_password(username)
    return "496d8108d4610f62c6cd8a27627e042a" if username == "as09admin"
  end

  def to_csv(list)
    csv = ""
    list.each do |attendant|
      attendant.keys.each do |key|
        csv << "\"" + attendant[key].to_s + "\""
        csv << ';'
      end
      csv << "\n"
    end
    csv
  end
  
end
