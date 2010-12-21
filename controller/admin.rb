class AdminController < Controller

  helper :aspect

  before_all{require_login}
  
  #HTML views

  def users
    all = User.all
    AdminView::Users.new(:controller => self, :users => all).to_s
  end

  def speakers
    speakers = User.speakers
    AdminView::Speakers.new(:controller => self, :speakers => speakers).to_s
  end

  def speaking_proposals
    speakers =User.all
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
  
  def users_csv
    to_csv(User.by_last_name)
  end

  def dinner_guests_csv
    to_csv(User.dinner_guests_by_lastname)
  end

  def speaking_proposals_csv
    to_csv(User.speakers_by_lastname)
  end

  def speaker_emails
    to_email(User.speakers_by_lastname)
  end

  def all_emails
    to_email(User.by_last_name)
  end

  def non_speaker_emails
    to_email(User.non_speakers_by_lastname)
  end

  protected



  def to_csv(list)
    csv = ""
    list.each do |user|
      add_value_to_csv(user.id, csv)
      add_value_to_csv(user.last_name, csv)
      add_value_to_csv(user.first_name, csv)
      add_value_to_csv(user.organization, csv)
      add_value_to_csv(user.email, csv)
      add_value_to_csv(user.address, csv)
      add_value_to_csv(user.zip_code, csv)
      add_value_to_csv(user.postal_address, csv)
      add_value_to_csv(user.attending_dinner, csv)
      add_value_to_csv(user.food_preferences, csv)
      add_value_to_csv(user.comments, csv)
      add_value_to_csv(user.speaking_proposal.title, csv)
      add_value_to_csv(user.speaking_proposal.abstract, csv)
      csv << "\n"
    end
    csv
  end

  def add_value_to_csv(value, csv)
    csv << "\"" + value.to_s + "\""
    csv << ';'
  end

  def to_email(list)
    list.collect! { |user| user.email }
    list.uniq!
    list.join ' ,'
  end
  
end
