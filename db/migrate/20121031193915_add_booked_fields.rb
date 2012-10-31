class AddBookedFields < ActiveRecord::Migration
  def self.up
    add_column :speaking_proposals, :booked_day1, :boolean
    add_column :speaking_proposals, :booked_day2, :boolean
  end

  def self.down
    remove_column :speaking_proposals, :booked_day1
    remove_column :speaking_proposals, :booked_day2
  end
end
