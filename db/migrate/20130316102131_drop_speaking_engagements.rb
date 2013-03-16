class DropSpeakingEngagements < ActiveRecord::Migration
  def self.up
    drop_table :speaking_engagements
  end

  def self.down
    create_table :speaking_engagements do |t|
      t.integer :user_id
      t.integer :speaking_proposal_id
      t.timestamps
    end
  end
end
