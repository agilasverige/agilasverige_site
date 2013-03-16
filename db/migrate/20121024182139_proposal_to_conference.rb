class ProposalToConference < ActiveRecord::Migration
  def self.up
    add_column :speaking_proposals, :conference_id, :integer

    c = Conference.first
    SpeakingProposal.all.each do |sp|
      sp.conference_id = c.id
      sp.save!
    end
  end

  def self.down
    remove_column :speaking_proposals, :conference_id
  end
end
