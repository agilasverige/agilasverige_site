# coding: utf-8
require 'spec_helper'

describe SpeakingProposal do

  it {should have_many :speakers}
  it {should validate_presence_of :title}
  it {should validate_presence_of :abstract}

  context 'without speakers' do
    it { should_not be_valid }
  end
end
