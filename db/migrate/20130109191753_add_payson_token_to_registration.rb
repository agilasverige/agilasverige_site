class AddPaysonTokenToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :payson_token, :string
  end

  def self.down
    remove_column :registrations, :payson_token
  end
end
