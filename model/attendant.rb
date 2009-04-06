require 'couchrest'

class Attendant < CouchRest::ExtendedDocument


  use_database CouchRest.database!('http://localhost:5984/agilasverige')
  timestamps!
  
  property :first_name
  property :last_name
  property :email
  property :organization
  property :address
  property :zip_code
  property :postal_address
  property :country
  property :attending_dinner
  property :food_preferences
  property :comments
  property :speaking_proposal, :cast_as => 'SpeakingProposal'
  
  view_by :last_name
  view_by :email

  # def speaker?
  #   speaking_proposals.each do |proposal|
  #     return true if proposal.accepted?
  #   end
  # end

  # def full_name
  #   "#{first_name} #{last_name}"
  # end
  # def save
  #   saved_with_same_email = Attendant.by_email(:key => self.email).first
  #   unless(saved_with_same_email.nil? || saved_with_same_email.id == id)
  #     raise ArgumentError.new("A user with email #{email} already exists")
  #   end
  #   super
  # end
  
end
