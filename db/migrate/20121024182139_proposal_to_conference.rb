class ProposalToConference < ActiveRecord::Migration
  def self.up
    add_column :speaking_proposals, :conference_id, :integer

    c = Conference.first
    SpeakingProposal.all.each do |sp|
      sp.conference = c
      sp.save!
    end
  end

  def self.down
    remo_column :speaking_proposals, :conference_id
  end
end
