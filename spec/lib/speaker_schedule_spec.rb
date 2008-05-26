require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe "SpeakerSchedule" do
  
  before(:each) do
    @schedule = SpeakerSchedule.new
  end
  
  it "should have id 1 on day 1, track 1, slot 1, talk 1" do
    speaking_proposal = mock("speaking_proposal")
    speaking_proposal.should_receive(:title).and_return("Introduktion")
    SpeakingProposal.should_receive(:first).with(:id => 49).and_return(speaking_proposal)
    @schedule.title(:day => 1, :track => 1, :slot => 1, :talk => 1).should == "Introduktion"
  end

  it "should have Marcus Ahnve on day 1, track 1, slot 1, talk 1" do
    speaking_proposal = mock("speaking_proposal")
    speaking_proposal.should_receive(:attendant_full_name).and_return("Marcus Ahnve")
    SpeakingProposal.should_receive(:first).with(:id => 49).and_return(speaking_proposal)
    @schedule.speaker(:day => 1, :track => 1, :slot => 1, :talk  => 1).should == "Marcus Ahnve"
  end
  
  it "should have a description on day 1, track 1, slot 1, talk 1" do
    speaking_proposal = mock("speaking_proposal")
    speaking_proposal.should_receive(:description).and_return("Description")
    SpeakingProposal.should_receive(:first).with(:id => 49).and_return(speaking_proposal)
    @schedule.description(:day => 1, :track => 1, :slot => 1, :talk  => 1).should == "Description"
  end
  it "should have a organization on day 1, track 1, slot 1, talk 1" do
    speaking_proposal = mock("speaking_proposal")
    speaking_proposal.should_receive(:organization).and_return("organization")
    SpeakingProposal.should_receive(:first).with(:id => 49).and_return(speaking_proposal)
    @schedule.organnization(:day => 1, :track => 1, :slot => 1, :talk  => 1).should == "organization"
  end
  it "should find something in the middle" do
    speaking_proposal = mock("speaking_proposal")
    speaking_proposal.should_receive(:attendant_full_name).and_return("Marcus Ahnve")
    SpeakingProposal.should_receive(:first).with(:id => 26).and_return(speaking_proposal)
    @schedule.speaker(:day => 2, :track => 2, :slot => 1, :talk  => 3).should == "Marcus Ahnve"
  end


  it "should find return empty string for nils" do
    SpeakingProposal.should_receive(:first).with(:id => 26).and_return(nil)
    @schedule.speaker(:day => 2, :track => 2, :slot => 1, :talk  => 3).should == ""
  end

  it "should find return empty string for nils" do
    SpeakingProposal.should_receive(:first).with(:id => 26).and_return(nil)
    @schedule.title(:day => 2, :track => 2, :slot => 1, :talk  => 3).should == ""
  end
end

