class AdminController < Controller

  helper :aspect

  before_all{require_login}
  
  #HTML views

  def attendants
    all = Attendant.all
    AdminView::Attendants.new(:controller => self, :attendants => all).to_s
  end

  def speaking_proposals
    speakers =Attendant.all
    Ramaze::Log.debug speakers.inspect
    AdminView::SpeakingProposals.new(:controller => self, 
                                     :speakers => speakers).to_s
  end

  def email(action)
    if request.get?
      AdminView::Email.new(:controller => self).to_s
    elsif request.post?
      email = MassEmail.new(request[:subject], request[:email_body])
      email.send
      flash['info'] = 'Email skickat'
      redirect '/admin/email/new'
    end
  end

  # CSV views
  
  def attendants_csv
    to_csv(Attendant.by_last_name)
  end

  def dinner_guests_csv
    to_csv(Attendant.dinner_guests_by_lastname)
  end

  def speaking_proposals_csv
    to_csv(Attendant.speakers_by_lastname)
  end

  def speaker_emails
    to_email(Attendant.speakers_by_lastname)
  end

  def all_emails
    to_email(Attendant.by_last_name)
  end

  def non_speaker_emails
    to_email(Attendant.non_speakers_by_lastname)
  end

  protected



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

  def to_email(list)
    list.collect! { |attendant| attendant.email }
    list.uniq!
    list.join ' ,'
  end
  
end
