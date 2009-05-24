describe Day do

  before(:each) do
    @day = Day.new('name')
  end


  it 'should have a name' do
    @day.name.should == 'name'
  end

  it 'can have slots added' do
    @day.add_slot('08:30', '321', '123')
    @day.slot_at('08:30').should == ['321','123']
  end

end

