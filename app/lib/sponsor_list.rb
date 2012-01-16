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
      # Sponsor.new("AddQ", "addq_logo.png", "http://www.addq.se"),
      # Sponsor.new("Valtech", "valtech_logo.png", "http://www.valtech.se"),
      # Sponsor.new("Agero", "agero_logo.png", "http://www.agero.se"),
      Sponsor.new("GlobalInn", "globalinn_logo.png", "http://www.globalinn.com"),
      # Sponsor.new("Avega", "avega_logo.png", "http://www.avegagroup.se"),
      # Sponsor.new("Jaybis", "jaybis_logo.png", "http://www.jaybis.se"),
      Sponsor.new("Adaptiv", "adaptiv_logo.png", "http://www.adaptiv.se"),
      # Sponsor.new("Sogeti", "sogeti_logo.png", "http://www.sogeti.se"),
      Sponsor.new("Attentec", "attentec_logo.png", "http://www.attentec.se"),
      # Sponsor.new("Citerus", "citerus_logo.png", "http://www.citerus.se"),
      Sponsor.new("Responsive", "responsive_logo.png", "http://www.responsive.se"),
      # Sponsor.new("CAG", "cag_logo.png", "http://www.cag.se"),
      # Sponsor.new("Omegapoint", "omegapoint_logo.png", "http://www.omegapoint.se")
      # Sponsor.new("Abiliteam", "abiliteam_logo.png", "http://www.abiliteam.se")
      # Sponsor.new("Informator", "informator_logo.png", "http://www.informator.se"),
      # Sponsor.new("Crisp", "crisp_logo.png", "http://www.crisp.se")
    ]
  end
  
  def random_order
    @sponsors.sort_by{rand}
  end
end
