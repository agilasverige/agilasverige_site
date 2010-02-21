require File.join(File.dirname(__FILE__),'..','spec_helper')

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


  it 'should have Monday and Tuesday' do 
    @schedule.monday.name.should == 'Måndag'
    @schedule.tuesday.name.should == 'Tisdag'
  end
end

