class Attendant 
  include DataMapper::Resource

  has n, :speaking_proposals

  validates_present :first_name, :last_name, :street_address, 
                        :postal_address, :zip_code, :message => "måste fyllas i"
    
  validates_is_unique :email, :case_sensitive => false, :message => "redan registrerad"
  validates_format :email, :with => :email_address, :message => "är inte en korrekt e-postadress"
  

  
  property :id, Integer, :serial => true
  property :first_name, String
  property :last_name, String
  property :email, String
  property :co_address, String
  property :street_address, String
  property :zip_code, String
  property :postal_address, String
  property :country, String
  property :organization, String
  property :telephone_number, String
  property :wants_to_speak, Boolean
  property :created_at, DateTime
  
  
  
  def prospective_speaker?
    !speaking_proposals.empty?
  end
  
  def speaker?
    speaking_proposals.each do |proposal|
      return true if proposal.accepted?
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
