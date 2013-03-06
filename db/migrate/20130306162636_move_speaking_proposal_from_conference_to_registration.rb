class MoveSpeakingProposalFromConferenceToRegistration < ActiveRecord::Migration
  def self.up
    add_column :speaking_proposals, :registration_id, :integer

    SpeakingProposal.all.each do |sp|
      speaker = sp.speakers.first
      conf = sp.conference
      unless speaker.nil? or conf.nil?
        reg = Registration.create!(user_id: speaker.id, conference_id: conf.id)
        sp.registration = reg
        sp.save!
      end
    end

    remove_column :speaking_proposals, :conference_id
  end

  def self.down
  end
end
