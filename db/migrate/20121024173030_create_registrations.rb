class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.references :user
      t.references :conference

      t.timestamps
    end
    c = Conference.first
    User.all.each do |u|
      Registration.create!(user: u, conference: c)
    end
  end

  def self.down
    drop_table :registrations
  end
end
