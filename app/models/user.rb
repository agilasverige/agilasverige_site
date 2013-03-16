require 'digest/md5'

class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :token_authenticatable

  has_many :speaking_proposals, :through => :registrations
  has_many :registrations
  has_many :conferences, through: :registrations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :organization

  scope :created_today, where('users.created_at > ? AND users.created_at < ?', Date.today, Date.tomorrow)
  scope :last_five, limit(5).order('users.created_at DESC')

  def self.created_by_date
    orig_data = count(:group => "DATE(users.created_at)")
    date_range = (orig_data.keys.min..orig_data.keys.max)

    data = {}
    date_range.each do |date|
      data[date] = orig_data[date] || 0
    end
    data
  end

  def confirmed_attendant_this_year?
    Conference.current.users.include?(self)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end

  def gravatar_url
    "http://www.gravatar.com/avatar/#{gravatar_hash}?d=mm"
  end

  private

  def gravatar_hash
    Digest::MD5.hexdigest(email.downcase)
  end
end
