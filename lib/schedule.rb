class Schedule

  MONDAY_SLOTS = ['09:12 - 09:22',
                  '09:24 - 09:34',
                  '09:36 - 09:46',
                  '09:48 - 09:58',
                  '10:20 - 10:30',
                  '10:32 - 10:42', 
                  '10:44 - 10:54',
                  '10:56 - 11:06',
                  '11:08 - 11:18',
                  '11:30 - 11:40',
                  '11:42 - 11:52',
                  '11:54 - 12:04',
                  '12:06 - 12:16',
                  '12:18 - 12:28']

  TUESDAY_SLOTS = ['09:00 - 09:10',
                  '09:12 - 09:22',
                  '09:24 - 09:34',
                  '09:36 - 09:46',
                  '09:48 - 09:58',
                  '10:20 - 10:30',
                  '10:32 - 10:42', 
                  '10:44 - 10:54',
                  '10:56 - 11:06',
                  '11:08 - 11:18',
                  '11:30 - 11:40',
                  '11:42 - 11:52',
                  '11:54 - 12:04',
                  '12:06 - 12:16',
                  '12:18 - 12:28']

  ROOMS =['Polhem', 'Celsius']

  attr_reader :rooms, :days

  def initialize
    @rooms = ROOMS
    @days = [Day.new('Måndag'),Day.new('Tisdag')]
    setup_monday
    setup_tuesday
  end

  def monday 
    @days[0]
  end

  def tuesday 
    @days[1]
  end

  protected


  def setup_monday
    monday.add_slot(MONDAY_SLOTS[0], '4bc224a0e5ce30160c000005', '4bc30093e5ce306328000003')
    monday.add_slot(MONDAY_SLOTS[1], '4bc0ecf6e5ce302964000004', '4bc23de5e5ce301bcd000002')
    monday.add_slot(MONDAY_SLOTS[2], '4bb22b95e5ce300de2000002', '4bb1b0bbe5ce30622f000003')
    monday.add_slot(MONDAY_SLOTS[3], '4bc22ae6e5ce30160c00000c', '4bb3b895e5ce301793000002')

    monday.add_slot(MONDAY_SLOTS[4], '4bc2243ce5ce30160c000003', '4bc1ce3ee5ce307771000002')
    monday.add_slot(MONDAY_SLOTS[5], '4babbb80e5ce30512a000002', '4bbf08afe5ce300254000002')
    monday.add_slot(MONDAY_SLOTS[6], '4bbc52d3e5ce301238000003', '4bb1b7efe5ce3064fd000003')
    monday.add_slot(MONDAY_SLOTS[7], '4bbf1179e5ce3005f0000004', '4bbf3be0e5ce3014a6000002')
    monday.add_slot(MONDAY_SLOTS[8], '4bc03c05e5ce306c3f000002', '4bc24213e5ce301bcd000004')

    monday.add_slot(MONDAY_SLOTS[9], '4bc47a42e5ce306540000005', '4bc22e08e5ce30160c00000e')
    monday.add_slot(MONDAY_SLOTS[10], '4bc20fcae5ce300faf000002', '4babebb0e5ce305eb1000007')
    monday.add_slot(MONDAY_SLOTS[11], '4bc84158e5ce3037b3000002', '4bc45f51e5ce305d40000002')
    monday.add_slot(MONDAY_SLOTS[12], '4bc20533e5ce300bb5000003', '4bc21675e5ce300faf000009')
    monday.add_slot(MONDAY_SLOTS[13], '4bc0c6bee5ce301d40000003', '4bc0c81ce5ce301d40000006')
  end

  def setup_tuesday
    tuesday.add_slot(TUESDAY_SLOTS[0], '4bc2d415e5ce30506b000009', '4bbf10c7e5ce3005f0000003')
    tuesday.add_slot(TUESDAY_SLOTS[1], '4bbc62dae5ce301848000002', '4bbac4dae5ce3007e5000002')
    tuesday.add_slot(TUESDAY_SLOTS[2], '4bcefc84e5ce30087000000a', '4bc21deee5ce301491000002')
    tuesday.add_slot(TUESDAY_SLOTS[3], '4bbd9ca9e5ce300534000002', '4bc2c117e5ce304d77000002')
    tuesday.add_slot(TUESDAY_SLOTS[4], '4bc21916e5ce300faf000010', '4bbc32cce5ce3006ff000003')

    tuesday.add_slot(TUESDAY_SLOTS[5], '4bc24230e5ce301bcd000005', '4bc225ece5ce30160c000006')
    tuesday.add_slot(TUESDAY_SLOTS[6], '4bc03e64e5ce306c3f000004', '4bcbffdee5ce300395000004')
    tuesday.add_slot(TUESDAY_SLOTS[7], '4bc20853e5ce300d26000002', '4bac7668e5ce301386000002')
    tuesday.add_slot(TUESDAY_SLOTS[8], '4bb1e557e5ce307444000002', '4bcdf1cfe5ce302fa2000002')
    tuesday.add_slot(TUESDAY_SLOTS[9], '4bc0b646e5ce3015f6000004', '4bbe41dce5ce303d4a000002')

    tuesday.add_slot(TUESDAY_SLOTS[10], '4bc22220e5ce30160c000002', '4bb1049ee5ce302636000002')
    tuesday.add_slot(TUESDAY_SLOTS[11], '4b9f53b2e5ce306fc600001b', '4bc77124e5ce306e66000002')
    tuesday.add_slot(TUESDAY_SLOTS[12], '4bc30069e5ce306328000002', '4bcebaa8e5ce307570000005')
    tuesday.add_slot(TUESDAY_SLOTS[13], '4bc4e009e5ce300aa0000002', '4bce0bf6e5ce3037c8000002')
    tuesday.add_slot(TUESDAY_SLOTS[14], '4bcf7d5ce5ce3039a4000002', '4bcbe10fe5ce3077f600000a')
  end
end
