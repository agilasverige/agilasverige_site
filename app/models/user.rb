class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :token_authenticatable

  has_many :speaking_engagements
  has_many :speaking_proposals, :through => :speaking_engagements

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :organization
  validates_presence_of :address
  validates_presence_of :zip_code
  validates_presence_of :postal_address


  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end

end
