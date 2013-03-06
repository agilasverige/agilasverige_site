class Add2013Conf < ActiveRecord::Migration
  def self.up
    Conference.create!(year: 2013)
  end

  def self.down
  end
end
