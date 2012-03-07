class AddPresentationToProposal < ActiveRecord::Migration
  def self.up
    add_column :speaking_proposals, :presentation, :string
  end

  def self.down
    remove_column :speaking_proposals, :presentation
  end
end
