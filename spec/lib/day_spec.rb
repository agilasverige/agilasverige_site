describe Day do

  before(:each) do
    @day = Day.new('name', ['08:00 - 08:01'])
  end

  it 'should have slots' do
    @day.slots.should == ['08:00 - 08:01']
  end

  it 'should have a name' do
    @day.name.should == 'name'
  end

end

