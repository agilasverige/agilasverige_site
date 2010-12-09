class Attendant

  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name
  field :last_name
  field :email
  field :organization
  field :address
  field :zip_code
  field :postal_address
  field :invoice_reference
  field :country
  field :telephone_number
  field :attending_dinner, :type => Boolean
  field :food_preferences
  field :comments
  field :unregistered

  references_many :speaking_proposals, :stored_as => :array, :inverse_of => :speakers

  before_create :set_uid

  def self.speakers
    Attendant.all.select {|attendant| attendant.speaking_proposals.size > 0}
  end
    
  def full_name
    "#{first_name} #{last_name}"
  end

  def speaker?
    speaking_proposals.size > 0
  end

  def unique_url
    "http://www.agilasverige.se/attendant/#{@uid}"
  end

  private

  def set_uid
    self.uid  = rand(2**256).to_s(36)[0..16]
  end


end
