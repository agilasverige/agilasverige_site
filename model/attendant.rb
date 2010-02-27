class Attendant

  include MongoMapper::Document

  key :first_name, String, :required => true
  key :last_name, String
  key :email, String
  key :organization, String
  key :address, String
  key :zip_code, String
  key :postal_address, String
  key :country, String
  key :telephone_number, String
  key :attending_dinner, Boolean
  key :food_preferences, String
  key :comments, String


  def full_name
    "#{first_name} #{last_name}"
  end

  def speaker?
    true
  end

end
