require 'spec'

describe Schedule do

  before(:each) do
    @schedule = Schedule.new
  end

  it 'should have Polhem and Celsius rooms' do
    @schedule.rooms.should include 'Polhem'
    @schedule.rooms.should include 'Celsius'
  end
  
  it 'should have Monday and Tuesday' do 
    @schedule.days[0].name.should == 'Måndag'
    @schedule.days[1].name.should == 'Tisdag'
  end
end

