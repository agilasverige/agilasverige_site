require 'spec'

describe Schedule do

  before(:each) do
    @schedule = Schedule.new
  end

  it 'should have Polhem rooms' do
    @schedule.rooms.should include 'Polhem'
  end
  
  it 'should have Celsius rooms' do
    @schedule.rooms.should include 'Celsius'
  end

  it "should have 'all' room" do
    @schedule.rooms.should include 'All'
  end

  it 'should have Monday and Tuesday' do 
    @schedule.days[0].name.should == 'Måndag'
    @schedule.days[1].name.should == 'Tisdag'
  end
end

