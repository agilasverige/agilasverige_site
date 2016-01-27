class Add2016Conference < ActiveRecord::Migration
  def self.up
        Conference.create!(year: 2016)
  end

  def self.down
        Conference.delete_all(year: 2016)
  end
end
