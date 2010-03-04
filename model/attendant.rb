class Attendant

  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String, :required => true
  key :email, String, :required => true
  key :organization, String, :required => true
  key :address, String, :required => true
  key :zip_code, String, :required => true
  key :postal_address, String, :required => true
  key :country, String
  key :telephone_number, String
  key :attending_dinner, Boolean
  key :food_preferences, String
  key :comments, String
  key :uid, String

  timestamps!

  before_create :set_uid

  def full_name
    "#{first_name} #{last_name}"
  end

  def speaker?
    true
  end

  private

  def set_uid
    self.uid  = Digest::SHA1.hexdigest(email + 'blutt')
  end


end
