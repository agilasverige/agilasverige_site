class AddEditableContent < ActiveRecord::Migration
  def self.up
    create_table :editable_content do |t|
      t.text :content
      t.string :page_name
    end
  end

  def self.down
    drop_table :editable_content
  end
end
