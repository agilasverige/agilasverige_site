class CreateSpeakingProposals < ActiveRecord::Migration
  def self.up
    create_table :speaking_proposals do |t|
      t.string :title
      t.text :abstract

      t.timestamps
    end
  end

  def self.down
    drop_table :speaking_proposals
  end
end
