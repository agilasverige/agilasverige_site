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
    monday.add_slot(MONDAY_SLOTS[0], '49f3145368398b7c1f6ad46efbd950ff', '60164966329af99258739c60ac10123a')
    monday.add_slot(MONDAY_SLOTS[1], '0686eaa4ea9784800c8202420aa5f577', 'a0c860b04d0e3388ef198a5eca483aa3')
    monday.add_slot(MONDAY_SLOTS[2], '8c98fe235c2800b620c89a9bc4f69afc', '9ee6a63dccc531c436975e978cb48748')
    monday.add_slot(MONDAY_SLOTS[3], 'b332e8fc8e1faf8ec4413e0653719fb3', 'dd7774b5277530416037b9e972ff1883')

    monday.add_slot(MONDAY_SLOTS[4], 'daf2793559acf601b1fbcc99b6b3cd9b', 'e8cc57326ab9112a116be93a22fa0ec0')
    monday.add_slot(MONDAY_SLOTS[5], 'dd701b51fbb88ef55132342a1e6aa320', '361db5fb16b6580205d7224990827d9f')
    monday.add_slot(MONDAY_SLOTS[6], 'e447ef84faec5ab672d0a2b23106674c', '3e6d5b0a38d99e3d2e738228e6b416b8')
    monday.add_slot(MONDAY_SLOTS[7], 'c2e4d9ff67e581a6d4cd54e5af5d2199', '69580c30faab03bffb1dd24c4ab18927')
    monday.add_slot(MONDAY_SLOTS[8], '00425080e53daafc4aebc1cedad01f64', '6fac4bcc3725ce27a0f79e02a31c4d6d')

    monday.add_slot(MONDAY_SLOTS[9], '8e57f5c2ebbd082056eaa880e6880ef1', '6c370fece4006877a3c528cfed5cab28')
    monday.add_slot(MONDAY_SLOTS[10], '10431a87a0ca04ad49b5fcf70a70f7d5', '4caa9d77e7fdb28712f7f3adb4581309')
    monday.add_slot(MONDAY_SLOTS[11], '13474ae67c3af9210cf34d808aebf980', '5e0229ff9bde2a965dcf68a68d3c74bd')
    monday.add_slot(MONDAY_SLOTS[12], '821c1cdbd4e5ecba855e3b06106b13a7', 'cc4b42773a21f832cc3762725fb74810')
    monday.add_slot(MONDAY_SLOTS[13], 'd1b81518d3b66bb095de29c3faf51893', 'f635e6765e9761408a43ae3c8ed40c60')
  end

  def setup_tuesday
    tuesday.add_slot(TUESDAY_SLOTS[0], '4bc2d415e5ce30506b000009', '4bbf10c7e5ce3005f0000003')
    tuesday.add_slot(TUESDAY_SLOTS[1], '4bbc62dae5ce301848000002', '4bbac4dae5ce3007e5000002')
    tuesday.add_slot(TUESDAY_SLOTS[2], '4bc300bbe5ce306328000004', '4bc21deee5ce301491000002')
    tuesday.add_slot(TUESDAY_SLOTS[3], '4bbd9ca9e5ce300534000002', '4bc2c117e5ce304d77000002')
    tuesday.add_slot(TUESDAY_SLOTS[4], '4bc21916e5ce300faf000010', '4bbc32cce5ce3006ff000003')

    tuesday.add_slot(TUESDAY_SLOTS[5], '4bc24230e5ce301bcd000005', '4bc225ece5ce30160c000006')
    tuesday.add_slot(TUESDAY_SLOTS[6], '4bc03e64e5ce306c3f000004', '4bcbffdee5ce300395000004')
    tuesday.add_slot(TUESDAY_SLOTS[7], '4bc20853e5ce300d26000002', '4bac7668e5ce301386000002')
    tuesday.add_slot(TUESDAY_SLOTS[8], '4bb1e557e5ce307444000002', '4babebb0e5ce305eb1000007')
    tuesday.add_slot(TUESDAY_SLOTS[9], '4bc0b646e5ce3015f6000004', '4bbe41dce5ce303d4a000002')

    tuesday.add_slot(TUESDAY_SLOTS[10], '4bc22220e5ce30160c000002', '4bb1049ee5ce302636000002')
    tuesday.add_slot(TUESDAY_SLOTS[11], '4b9f53b2e5ce306fc600001b', '4bc77124e5ce306e66000002')
    tuesday.add_slot(TUESDAY_SLOTS[12], '4bc30069e5ce306328000002', '4bcbe10fe5ce3077f600000a')
    tuesday.add_slot(TUESDAY_SLOTS[13], '4bc4e009e5ce300aa0000002', '4bce0bf6e5ce3037c8000002')
    tuesday.add_slot(TUESDAY_SLOTS[14], '', '')
  end
end
