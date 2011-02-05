class CreateSpeakingEngagements < ActiveRecord::Migration
  def self.up
    create_table :speaking_engagements do |t|
      t.integer :user_id
      t.integer :speaking_proposal_id
      t.timestamps
    end
  end

  def self.down
    drop_table :speaking_engagements
  end
end
