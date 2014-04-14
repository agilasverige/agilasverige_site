class CreateIpns < ActiveRecord::Migration
  def self.up
    create_table :ipns do |t|
      t.text :data

      t.timestamps
    end
  end

  def self.down
    drop_table :ipns
  end
end
