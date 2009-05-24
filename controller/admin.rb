class AdminController < Controller

  helper :aspect

  
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


  def to_csv(list)
    csv = ""
    list.each do |attendant|
      add_value_to_csv(attendant.id, csv)
      add_value_to_csv(attendant.last_name, csv)
      add_value_to_csv(attendant.first_name, csv)
      add_value_to_csv(attendant.organization, csv)
      add_value_to_csv(attendant.email, csv)
      add_value_to_csv(attendant.address, csv)
      add_value_to_csv(attendant.zip_code, csv)
      add_value_to_csv(attendant.postal_address, csv)
      add_value_to_csv(attendant.attending_dinner, csv)
      add_value_to_csv(attendant.food_preferences, csv)
      add_value_to_csv(attendant.comments, csv)
      add_value_to_csv(attendant.speaking_proposal.title, csv)
      add_value_to_csv(attendant.speaking_proposal.abstract, csv)
      csv << "\n"
    end
    csv
  end

  def add_value_to_csv(value, csv)
    csv << "\"" + value.to_s + "\""
    csv << ';'
  end
  
end
