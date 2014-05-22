class AddPaysonStatusToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :payson_ref, :text
  end

  def self.down
    remove_column :registrations, :payson_ref
  end
end
