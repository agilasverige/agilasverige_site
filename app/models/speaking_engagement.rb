class SpeakingEngagement < ActiveRecord::Base
  belongs_to :user
  belongs_to :speaking_proposal
end
