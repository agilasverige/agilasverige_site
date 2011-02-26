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

  scope :created_today, where('created_at > ? AND created_at < ?', Date.today, Date.tomorrow)
  scope :last_five, limit(5).order('created_at DESC')

  def self.created_by_date 
    orig_data = count(:group => "DATE(created_at)")
    date_range = (orig_data.keys.min..orig_data.keys.max)
    
    data = {}
    date_range.each do |date|
      data[date] = orig_data[date] || 0
    end
    data
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end

end
