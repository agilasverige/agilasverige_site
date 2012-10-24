class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.integer :year
      t.timestamps
    end
    c2012 = Conference.create!(year: 2012)
  end

  def self.down
    drop_table :conferences
  end
end
