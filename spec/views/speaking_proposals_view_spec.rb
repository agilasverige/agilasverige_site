require 'spec_helper'

describe '/speaking_proposals/show' do

  before :each do
    @speaking_proposal = SpeakingProposal.make!
    assign :speaking_proposal, @speaking_proposal
    render
  end

  it 'should show the title' do
    assert_select 'h2', @speaking_proposal.title
  end

  it 'should show the abstract' do
    assert_select 'p', @speaking_proposal.abstract
  end

end
