class Conference < ActiveRecord::Base
  has_many :registrations
  has_many :users, through: :registrations
end
