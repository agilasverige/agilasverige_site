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
  
end
