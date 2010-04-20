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
    monday.add_slot(MONDAY_SLOTS[10], '4bc20fcae5ce300faf000002', '4babee4ae5ce306295000002')
    monday.add_slot(MONDAY_SLOTS[11], '4bc84158e5ce3037b3000002', '4bc45f51e5ce305d40000002')
    monday.add_slot(MONDAY_SLOTS[12], '4bc20533e5ce300bb5000003', '4bc21675e5ce300faf000009')
    monday.add_slot(MONDAY_SLOTS[13], '4bc0c6bee5ce301d40000003', '4bc0c81ce5ce301d40000006')
  end

  def setup_tuesday
    tuesday.add_slot(TUESDAY_SLOTS[0], 'e8564dc38404a1f86087a6a1917108aa', 'be3e15f9b24deacaa80bfe65d1fe027b')
    tuesday.add_slot(TUESDAY_SLOTS[1], '062dd82c34369208f3a6cda909786aa8', '9ee92dbbe4f2c34fe4f9b361392dd324')
    tuesday.add_slot(TUESDAY_SLOTS[2], '71499ac8ad181b1669714ab4ce2b5c72', 'd15c1b3c333db832a6aefd96770901f8')
    tuesday.add_slot(TUESDAY_SLOTS[3], '879f6591284cce3bcd857d892bd76d64', '7505500af345d4c5de448f69ed9af2de')
    tuesday.add_slot(TUESDAY_SLOTS[4], '0698f8dd56663f6882f0f8e2f31b7a47', 'c9a6b6a8c0c75a3cc5226db3b9011cda')

    tuesday.add_slot(TUESDAY_SLOTS[5], '18a35f6b62488f0d0a4e86bcb8cdfc2f', '7d6b62f18f852d2b3775b4992255a02d')
    tuesday.add_slot(TUESDAY_SLOTS[6], '121d8199104d45a8688ee07233b6b499', '192de1197d47658b49c818ea2b0c92f5')
    tuesday.add_slot(TUESDAY_SLOTS[7], 'd983352b62664a69f9edda897108b4ab', '2ccad8aa15cf46909221fd089431fe4a')
    tuesday.add_slot(TUESDAY_SLOTS[8], 'fdec95e03cafedc2ea571354a4cb3286', 'ba7a1fb5c2e513b96e4a61a3162e11e5')
    tuesday.add_slot(TUESDAY_SLOTS[9], 'f9eb28c16fcd36d453ca433f7c9e469d', 'e1fe10068ece3b6f33bc3a608eeb5562')

    tuesday.add_slot(TUESDAY_SLOTS[10], '7384ec11da0d9c152c918c9278f74f61', 'dfcd8940077aa50a2ffa197693826d7a')
    tuesday.add_slot(TUESDAY_SLOTS[11], '0aa645dd565a45cc01536b52a25d8f44', '8fb8e89e94dcd442fabaf8ad3d23b1cb')
    tuesday.add_slot(TUESDAY_SLOTS[12], '4692442200d6916f72d3f2ff5d4c2d02', 'bee4a1d5b02f45d8145b1611d2b771de')
    tuesday.add_slot(TUESDAY_SLOTS[13], '62e9a8d9b37b0b2390c9df7ff9df1435', 'dd75f307bb47675134beb29589fc6543')
    tuesday.add_slot(TUESDAY_SLOTS[14], 'df906f780c3397c7a2804688f9d9f18d', '6798bb916dd465b0b53ece3c65a7cfe0')
  end
end
