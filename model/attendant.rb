class Attendant 
  
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :organization
  attr_accessor :address
  attr_accessor :zip_code
  attr_accessor :postal_address

  def initialize(args)


    #raise ArgumentError.new('Förnamn, efternamn, adress, postnummer och postadress är obligatoriska fält')
  end

  
  def first_name
    'First Name'
  end

  # def speaker?
  #   speaking_proposals.each do |proposal|
  #     return true if proposal.accepted?
  #   end
  # end

  # def full_name
  #   "#{first_name} #{last_name}"
  # end
  
end
