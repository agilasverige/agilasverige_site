class AddCommentToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :comment, :text
  end

  def self.down
    remove_column :registrations, :comment
  end
end
