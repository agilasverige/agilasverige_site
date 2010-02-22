require File.join(File.dirname(__FILE__),'..','spec_helper')

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

  # it "should have Agero" do
  #   agero = @sponsor_list.sponsor("Agero")
  #   agero.url.should == "http://www.agero.se"
  #   agero.logo_file.should == "agero_logo.png"
  # end
  # 
  # 
  # it "should have Agical" do
  #   agical = @sponsor_list.sponsor("Agical")
  #   agical.url.should == "http://www.agical.se"
  #   agical.logo_file.should == "agical_logo.png"
  # end
  # 
  # it "should have Dynabyte" do
  #   dynabyte = @sponsor_list.sponsor("Dynabyte")
  #   dynabyte.url.should == "http://www.dynabyte.se"
  #   dynabyte.logo_file.should == "dynabyte_logo.png"
  # end
  # 
  # it "should have Valtech" do
  #   valtech = @sponsor_list.sponsor("Valtech")
  #   valtech.url.should == "http://www.valtech.se"
  #   valtech.logo_file.should == "valtech_logo.png"
  # end
  # 
  # it "should have Avega" do
  #   avega = @sponsor_list.sponsor("Avega")
  #   avega.url.should == "http://www.avegagroup.se"
  #   avega.logo_file.should == "avega_logo.png"
  # end
  # 
  # it "should have Citerus" do
  #   citerus = @sponsor_list.sponsor("Citerus")
  #   citerus.url.should == "http://www.citerus.se"
  #   citerus.logo_file.should == "citerus_logo.png"
  # end
  # 
  # it "should have Responsive" do
  #   responsive = @sponsor_list.sponsor("Responsive")
  #   responsive.url.should == "http://www.responsive.se"
  #   responsive.logo_file.should == "responsive_logo.png"
  # end
  # 
  # it "should have Informator" do
  #   informator = @sponsor_list.sponsor("Informator")
  #   informator.url.should == "http://www.informator.se"
  #   informator.logo_file.should == "informator_logo.png"
  # end

  # it "should have Crisp" do
  #   crisp = @sponsor_list.sponsor("Crisp")
  #   crisp.url.should == "http://www.crisp.se"
  #   crisp.logo_file.should == "crisp_logo.png"
  # end
end

# describe "a random sponso0rlist" do
# n
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
