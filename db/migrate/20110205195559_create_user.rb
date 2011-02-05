class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :address
      t.string :zip_code
      t.string :postal_address
      t.string :country
      t.string :invoice_reference
      t.string :telephone_number
      t.boolean :attending_dinner
      t.string :food_preferences
      t.text :comments
      t.boolean :unregistered
      t.string :role
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end

end
