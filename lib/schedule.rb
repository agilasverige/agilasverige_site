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
    monday.add_slot(MONDAY_SLOTS[2], '8c98fe235c2800b620c89a9bc4f69afc', 'f9eb28c16fcd36d453ca433f7c9e469d')
    monday.add_slot(MONDAY_SLOTS[3], 'b332e8fc8e1faf8ec4413e0653719fb3', 'dd7774b5277530416037b9e972ff1883')

    monday.add_slot(MONDAY_SLOTS[4], 'daf2793559acf601b1fbcc99b6b3cd9b', 'cc4b42773a21f832cc3762725fb74810')
    monday.add_slot(MONDAY_SLOTS[5], 'd1b81518d3b66bb095de29c3faf51893', '361db5fb16b6580205d7224990827d9f')
    monday.add_slot(MONDAY_SLOTS[6], 'e447ef84faec5ab672d0a2b23106674c', '3e6d5b0a38d99e3d2e738228e6b416b8')
    monday.add_slot(MONDAY_SLOTS[7], 'c2e4d9ff67e581a6d4cd54e5af5d2199', 'e3c44f22b48df2f46baedcaf350e0584')
    monday.add_slot(MONDAY_SLOTS[8], 'e71a43fca09658b72615e7e24080d536', '6fac4bcc3725ce27a0f79e02a31c4d6d')

    monday.add_slot(MONDAY_SLOTS[9], '6c370fece4006877a3c528cfed5cab28', 'cc4b005f66e0cce812e1f6f8adab1fef')
    monday.add_slot(MONDAY_SLOTS[10], '10431a87a0ca04ad49b5fcf70a70f7d5', '4caa9d77e7fdb28712f7f3adb4581309')
    monday.add_slot(MONDAY_SLOTS[11], '13474ae67c3af9210cf34d808aebf980', '5e0229ff9bde2a965dcf68a68d3c74bd')
    monday.add_slot(MONDAY_SLOTS[12], '821c1cdbd4e5ecba855e3b06106b13a7', 'cc4b42773a21f832cc3762725fb74810')
    monday.add_slot(MONDAY_SLOTS[13], '9ee6a63dccc531c436975e978cb48748', 'f635e6765e9761408a43ae3c8ed40c60')
  end

  def setup_tuesday
    tuesday.add_slot(TUESDAY_SLOTS[0], 'e8564dc38404a1f86087a6a1917108aa', 'be3e15f9b24deacaa80bfe65d1fe027b')
    tuesday.add_slot(TUESDAY_SLOTS[1], '062dd82c34369208f3a6cda909786aa8', '9ee92dbbe4f2c34fe4f9b361392dd324')
    tuesday.add_slot(TUESDAY_SLOTS[2], '71499ac8ad181b1669714ab4ce2b5c72', 'a71266f84b445806b9595177b07a7403')
    tuesday.add_slot(TUESDAY_SLOTS[3], '879f6591284cce3bcd857d892bd76d64', '7505500af345d4c5de448f69ed9af2de')
    tuesday.add_slot(TUESDAY_SLOTS[4], '0698f8dd56663f6882f0f8e2f31b7a47', 'c9a6b6a8c0c75a3cc5226db3b9011cda')

    tuesday.add_slot(TUESDAY_SLOTS[5], '18a35f6b62488f0d0a4e86bcb8cdfc2f', '7d6b62f18f852d2b3775b4992255a02d')
    tuesday.add_slot(TUESDAY_SLOTS[6], '121d8199104d45a8688ee07233b6b499', '192de1197d47658b49c818ea2b0c92f5')
    tuesday.add_slot(TUESDAY_SLOTS[7], 'd983352b62664a69f9edda897108b4ab', '2ccad8aa15cf46909221fd089431fe4a')
    tuesday.add_slot(TUESDAY_SLOTS[8], 'fdec95e03cafedc2ea571354a4cb3286', 'ba7a1fb5c2e513b96e4a61a3162e11e5')
    tuesday.add_slot(TUESDAY_SLOTS[9], 'dd701b51fbb88ef55132342a1e6aa320', 'e1fe10068ece3b6f33bc3a608eeb5562')

    tuesday.add_slot(TUESDAY_SLOTS[10], '7384ec11da0d9c152c918c9278f74f61', 'dfcd8940077aa50a2ffa197693826d7a')
    tuesday.add_slot(TUESDAY_SLOTS[11], '0aa645dd565a45cc01536b52a25d8f44', '8fb8e89e94dcd442fabaf8ad3d23b1cb')
    tuesday.add_slot(TUESDAY_SLOTS[12], '4692442200d6916f72d3f2ff5d4c2d02', 'bee4a1d5b02f45d8145b1611d2b771de')
    tuesday.add_slot(TUESDAY_SLOTS[13], '62e9a8d9b37b0b2390c9df7ff9df1435', 'dd75f307bb47675134beb29589fc6543')
    tuesday.add_slot(TUESDAY_SLOTS[14], 'df906f780c3397c7a2804688f9d9f18d', '6798bb916dd465b0b53ece3c65a7cfe0')
  end
end
