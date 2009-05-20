class Schedule

  MONDAY_SLOTS = ['08:00 - 09:00',
                  '09:00 - 09:10',
                  '09:12 - 09:22',
                  '09:24 - 09:34',
                  '09:36 - 09:46',
                  '09:48 - 09:58',
                  '10:00 - 10:20',
                  '10:20 - 10:30',
                  '10:32 - 10:42', 
                  '10:44 - 10:54',
                  '10:56 - 11:06',
                  '11:08 - 11:18',
                  '11:20 - 11:30',
                  '11:30 - 11:40',
                  '11:42 - 11:52',
                  '11:54 - 12:04',
                  '12:06 - 12:16',
                  '12:18 - 12:28',
                  '12:30 - 13:30',
                  '13:30 - 14:15',
                  '14:15 - 15:00',
                  '15:15 - 16:00',
                  '16:15 - 17:00']

  TUESDAY_SLOTS = ['09:00 - 09:10',
                  '09:12 - 09:22',
                  '09:24 - 09:34',
                  '09:36 - 09:46',
                  '09:48 - 09:58',
                  '10:00 - 10:20',
                  '10:20 - 10:30',
                  '10:32 - 10:42', 
                  '10:44 - 10:54',
                  '10:56 - 11:06',
                  '11:08 - 11:18',
                  '11:20 - 11:30',
                  '11:30 - 11:40',
                  '11:42 - 11:52',
                  '11:54 - 12:04',
                  '12:06 - 12:16',
                  '12:18 - 12:28',
                  '12:30 - 13:30',
                  '13:30 - 14:00',
                  '14:00 - 14:45',
                  '15:00 - 15:45',
                  '16:00 - 16:45']

  ROOMS =['Polhem', 'Celsius', 'All'] 

  attr_reader :rooms, :days

  def initialize
    @rooms = ROOMS
    @days = [monday, tuesday]
  end

  protected

  def monday 
    Day.new('Måndag')
  end

  def tuesday 
    Day.new('Tisdag')
  end

end
