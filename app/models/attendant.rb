class Attendant < DataMapper::Base

  validates_presence_of :first_name, :last_name, :street_address, :postal_address

  property :first_name, :string
  property :last_name, :string
  property :email, :string
  property :co_address, :string
  property :street_address, :string
  property :zip_code, :string
  property :postal_address, :string
  property :country, :string
  property :organization, :string
  property :telephone_number, :string
end