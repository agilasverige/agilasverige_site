require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "Presentation" do

  before :each do
    @presentation = Presentation.new
  end

  it "should have a title" do
    @presentation.title = 'title'
    @presentation.title.should == 'title'
  end

  it 'should have an author' do
    @presentation.author = 'author'
    @presentation.author.should == 'author'
  end

end
