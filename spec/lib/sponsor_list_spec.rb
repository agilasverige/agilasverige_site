require 'spec_helper'

describe "SponsorList" do
  
  before do
    @sponsor_list = SponsorList.new
  end
  
  
  it 'should have all paying sponsors' do
    sponsors = [['GlobalInn','globalinn.com'],
                ['Agical','agical.se'],
                ['Dynabyte','dynabyte.se'],
                ['Adaptiv','adaptiv.se'],
                ['AddQ','addq.se'],
                ['Responsive', 'responsive.se']]

    sponsors.each do |sponsor|
      current_name = sponsor.first
      current_url_base = sponsor.last

      current_sponsor = @sponsor_list.sponsor(current_name)
      current_sponsor.url.should == "http://www.#{current_url_base}"
      current_sponsor.logo_file.should == "#{current_name.downcase}_logo.png"
    end
  
  end

  
end

describe "a random sponsorlist" do

  before do
    @sponsor_list = SponsorList.new
    @random_ordered_sponsors = @sponsor_list.random_order
  end

  it "should have 6 elements" do
    @random_ordered_sponsors.length.should == 6
  end
  
  it "should not provide the list ordered the same way twice" do
    @sponsor_list.random_order.should_not == @random_ordered_sponsors
  end
  
end
