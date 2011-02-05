class SpeakingProposal  < ActiveRecord::Base  

  has_many :speaking_engagements
  has_many :speakers, :through => :speaking_engagements, :source => :user

  validates_presence_of :title
  validates_presence_of :abstract
end

