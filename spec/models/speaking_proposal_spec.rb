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
  
  it "should have a level" do
    @speaking_proposal.level = "lätt"
    @speaking_proposal.level.should == "lätt"
  end

  it "should tell if it is accepted" do
    @speaking_proposal.accepted = true
    @speaking_proposal.accepted?.should == true
  end
end