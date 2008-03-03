require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe SpeakingProposal do

  before(:each) do
    @speaking_proposal = SpeakingProposal.new
  end

  it "should have a title" do
    @speaking_proposal.title = "title"
    @speaking_proposal.title.should == "title"
  end
  
  it "should have a description" do
    @speaking_proposal.description = "des"
    @speaking_proposal.description.should == "des"
    
  end

end