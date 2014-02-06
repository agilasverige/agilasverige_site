class Add2014Conference < ActiveRecord::Migration
  def self.up
  	Conference.create!(year: 2014)
  end

  def self.down
  	Conference.delete_all(year: 2014)
  end
end
