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
      #Sponsor.new("ThoughtWorks", "tw_logo.png", "http://www.thoughtworks.com"),
      Sponsor.new("Agero", "agero_logo.png", "http://www.agero.se"),
      Sponsor.new("GlobalInn", "globalinn_logo.png", "http://www.globalinn.com"),
      Sponsor.new("Avega", "avega_logo.png", "http://www.avegagroup.se"),
      #Sponsor.new("Orc Software", "orc_logo.png", "http://www.orcsoftware.com"),
      #Sponsor.new("Jaybis", "jaybis_logo.png", "http://www.jaybis.se"),
      Sponsor.new("Citerus", "citerus_logo.png", "http://www.citerus.se"),
      #Sponsor.new("Contactor", "contactor_logo.png", "http://www.contactor.se"),
      #Sponsor.new("Responsive", "responsive_logo.png", "http://www.responsive.se"),
      #Sponsor.new("Informator", "informator_logo.png", "http://www.informator.se")
    ]
  end
  
  def random_order
    @sponsors.sort_by{rand}
  end
end
