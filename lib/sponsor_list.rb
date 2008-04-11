Sponsor = Struct.new :name, :logo_file, :url

class SponsorList

  attr_reader :sponsors
  
  def initialize
    setup_sponsors
  end
  
  
  def sponsor(name)
    @sponsors.find{|o| o.name == name}
  end

  def setup_sponsors
    @sponsors = [
      Sponsor.new("Agical", "agical_logo.png", "http://www.agical.se"),
      Sponsor.new("Dynabyte", "dynabyte_logo.png", "http://www.dynabyte.se"),
      Sponsor.new("Valtech", "valtech_logo.png", "http://www.valtech.se"),
      Sponsor.new("ThoughtWorks", "tw_logo.png", "http://www.thoughtworks.com"),
      Sponsor.new("Agero", "agero_logo.png", "http://www.agero.se"),
      Sponsor.new("GlobalInn", "globalinn_logo.png", "http://www.globalinn.com"),
      Sponsor.new("Citerus", "citerus_logo.png", "http://www.citerus.se")
    ]
  end
end