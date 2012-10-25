require 'spec_helper'

describe "SponsorList" do
  
  let(:sponsor_list) { SponsorList.new }
  
  it 'should have all paying sponsors' do
    sponsors = [['Solidtango','solidtango.com'],
                ['Agical','agical.se']]
                # ['Dynabyte','dynabyte.se'],
                # ['Attentec','attentec.se'],
                # ['Valtech','valtech.se'],
                # ['Omegapoint','omegapoint.se'],
                # ['Citerus','citerus.se'],
                # ['Jaybis','jaybis.se'],
                # ['Sogeti','sogeti.se'],
                # ['CAG','cag.se'],
                # ['Agero','agero.se'],
                # ['Adaptiv','adaptiv.se'],
                # ['AddQ','addq.se'],
                # ['Responsive', 'responsive.se'],
                # ['Spotify', 'spotify.se']]

    sponsors.each do |sponsor|
      current_name = sponsor.first
      current_url_base = sponsor.last

      current_sponsor = sponsor_list.sponsor(current_name)
      current_sponsor.url.should == "http://www.#{current_url_base}"
      current_sponsor.logo_file.should == "#{current_name.downcase}_logo.png"
    end
  
  end

  
end

describe "#in_three_random_groups" do

  before do
    @sponsor_list =SponsorList.new([1,2,3,4,5,6,7,8,9,10]).in_three_random_groups  
  end

  subject { @sponsor_list }

  it { should have(3).items }

  describe 'the first group' do

    subject { @sponsor_list.first }

    it { should have(4).items }
  end

  describe 'the second group' do

    subject { @sponsor_list[1] }

    it { should have(3).items }
  end

  describe 'the third group' do

    subject { @sponsor_list[2] }

    it { should have(3).items }
  end
end

describe "a random sponsorlist" do

  let(:sponsor_list) {SponsorList.new}
  let(:random_ordered_sponsors) {@sponsor_list.random_order}

  it "should not provide the list ordered the same way twice" do
    pending 'need more sponsors so randomness is likely :)'
    # @sponsor_list.random_order.should_not == @random_ordered_sponsors
  end
  
end
