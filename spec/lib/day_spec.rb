describe Day do

  before(:each) do
    @day = Day.new('name')
  end


  it 'should have a name' do
    @day.name.should == 'name'
  end

end

