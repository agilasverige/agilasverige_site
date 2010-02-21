require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "Presentations08" do
  
  before(:each) do
    @presentations08 = Presentations08.new
  end

  it 'should have 50 presentations' do
    @presentations08.size.should == 50
  end
  
  it 'should have ABC-programmering first in list' do
    @presentations08.first.title.should == "ABC-programmering"
    @presentations08.first.author.should == "Thomas Nilsson"
    @presentations08.first.files.first.should == "abc-programmering_-_thomas_nilsson.pdf"
  end

end

