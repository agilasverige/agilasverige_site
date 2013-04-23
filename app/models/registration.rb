class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :conference
  has_many :speaking_proposals

  scope :list, order('registrations.comment ASC, registrations.updated_at DESC')

end
