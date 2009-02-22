require File.join( File.dirname(__FILE__), "..", "..","lib", "sponsor_list" )
require 'bacon'

describe "SponsorList" do
  
  before do
    @sponsor_list = SponsorList.new
  end
  
  it "should have 1 sponsors" do
    @sponsor_list.sponsors.size.should == 1
  end
  
  
  it "should have GlobalInn" do
    globalinn = @sponsor_list.sponsor("GlobalInn")
    globalinn.url.should == "http://www.globalinn.com"
    globalinn.logo_file.should == "globalinn_logo.png"
  end
  
  
end

# describe "a random sponsorlist" do
# 
#   before do
#     @sponsor_list = SponsorList.new
#     @random_ordered_sponsors = @sponsor_list.random_order
#   end
# 
#   it "should have 1 elements" do
#     @random_ordered_sponsors.length.should == 1
#   end
#   
#   it "should not provide the list ordered the same way twice" do
#     @sponsor_list.random_order.should_not == @random_ordered_sponsors
#   end
#   
# end
