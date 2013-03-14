class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :conference
  has_many :speaking_proposals
end
