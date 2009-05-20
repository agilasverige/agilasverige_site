class Day

  attr_reader :name 

  def initialize(name)
    @slots = {}
    @name = name
  end

  def add_slot(time, room, slot)
    @slots[[time, room]] = slot
  end

  def slot_at(time, room)
    @slots[[time, room]]
  end
end

