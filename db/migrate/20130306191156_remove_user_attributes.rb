class RemoveUserAttributes < ActiveRecord::Migration
  def self.up
    remove_column :user, :address
    remove_column :user, :zip_code
    remove_column :user, :postal_code
    remove_column :user, :country
    remove_column :user, :telephone_number
  end

  def self.down
    add_column :user, :address, :string
    add_column :user, :zip_code, :string
    add_column :user, :postal_code, :string
    add_column :user, :country, :string
    add_column :user, :telephone_number, :string
  end
end
