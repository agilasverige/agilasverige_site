class RemoveUserAttributes < ActiveRecord::Migration
  def self.up
    remove_column :users, :address
    remove_column :users, :zip_code
    remove_column :users, :postal_address
    remove_column :users, :country
    remove_column :users, :telephone_number
  end

  def self.down
    add_column :users, :address, :string
    add_column :users, :zip_code, :string
    add_column :users, :postal_address, :string
    add_column :users, :country, :string
    add_column :users, :telephone_number, :string
  end
end
