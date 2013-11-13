require 'spec_helper'


describe "#randomized_rows" do

  before do
    @sponsor_list =SponsorList.new([1,2,3,4,5,6,7]).randomized_rows  
  end

  subject { @sponsor_list }

  it { should have(3).items }

  describe 'the first group' do

    subject { @sponsor_list.first }

    it { should have(3).items }
  end

  describe 'the second group' do

    subject { @sponsor_list[1] }

    it { should have(3).items }
  end

  describe 'the third group' do

    subject { @sponsor_list[2] }

    it { should have(1).items }
  end
end

describe "a random sponsorlist" do

  before do
    @sponsor_list = SponsorList.new([1,2,3,4,5,6,7])
    @random_ordered_sponsors = @sponsor_list.random_order
  end

  it "should not provide the list ordered the same way twice" do
    @sponsor_list.random_order.should_not == @random_ordered_sponsors
  end
  
end
