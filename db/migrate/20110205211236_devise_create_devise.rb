class DeviseCreateDevise < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.confirmable
      t.token_authenticatable
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
  end

  def self.down
    remove_index :users, :column => :confirmation_token
    remove_index :users, :column => :reset_password_token
    remove_index :users, :column => :email

    raise ActiveRecord::IrreversibleMigration
  end
end
