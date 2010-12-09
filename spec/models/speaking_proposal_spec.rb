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

  describe 'handles file name' do

    before(:each) do
      @speaking_proposal = SpeakingProposal.new
    end

    it 'should remove non ascii characters' do
      @speaking_proposal.title = 'hejaåäö!@#$%^&*'
      @speaking_proposal.base_file_name.should == 'heja'
    end

    it 'should remove trailing question marks' do
      @speaking_proposal.title = 'he?ja?'
      @speaking_proposal.base_file_name.should == 'heja'
    end

    it 'should convert spaces to underscores' do
      @speaking_proposal.title = 'heja alla bröd'
      @speaking_proposal.base_file_name.should == 'heja_alla_brd'
    end

    it 'should handle personlig kanban' do
      @speaking_proposal.title = 'Personlig kanban'
      @speaking_proposal.base_file_name.should == 'Personlig_kanban'
    end

  end
      
end
