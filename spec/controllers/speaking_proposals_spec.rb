require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe SpeakingProposals, "index action" do
  before(:each) do
    dispatch_to(SpeakingProposals, :index)
  end
end