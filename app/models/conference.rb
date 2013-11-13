class Conference < ActiveRecord::Base
  has_many :registrations
  has_many :users, through: :registrations
  has_many :speaking_proposals, through: :registrations

  def self.current
    order('year DESC').first || Conference.new
  end
end
