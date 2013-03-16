class MoveSpeakingEngagementsToRegistrations < ActiveRecord::Migration
  def self.up
    # Add registration_id to 2012 speaking_proposals if they exist
    conf_id_2012 = Conference.where(year: 2012).first.try(:id)
    if conf_id_2012
      SpeakingProposal.where("registration_id is null").each do |sp|
        sp.registration = Registration.where("conference_id = #{conf_id_2012} and user_id = (select user_id from speaking_engagements where speaking_proposal_id = #{sp.id})").first
        sp.save!
      end
    end
  end

  def self.down
  end
end
