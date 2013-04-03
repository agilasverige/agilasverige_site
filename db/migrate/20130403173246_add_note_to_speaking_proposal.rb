class AddNoteToSpeakingProposal < ActiveRecord::Migration
  def self.up
    add_column :speaking_proposals, :note, :text
  end

  def self.down
    remove_column :speaking_proposals, :note
  end
end
