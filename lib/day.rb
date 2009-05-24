class Day

  attr_reader :name 

  def initialize(name)
    @slots = {}
    @name = name
  end

  def add_slot(time, room_1_slot, room_2_slot)
    @slots[time] = [room_1_slot, room_2_slot]
  end

  def slot_at(time)
    @slots[time]
  end
end

