# coding: utf-8
require 'spec_helper'

describe SpeakingProposal do

  describe 'Without mandatory arguments' do
    before(:each) do
      @speaking_proposal = SpeakingProposal.new
    end

    it 'should not be saveable' do
      @speaking_proposal.valid?.should == false
    end
  end

  describe 'Created with all mandatory argument' do

    before(:each) do
      @speaking_proposal = create_speaking_proposal
    end

    it 'should be valid' do
      @speaking_proposal.valid?.should == true
    end

  end

  def create_speaking_proposal
    speaking_proposal = SpeakingProposal.new
    speaking_proposal.title = 'test title'
    speaking_proposal.abstract = 'abstract'
    speaking_proposal
  end
end
