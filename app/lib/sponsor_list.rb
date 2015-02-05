Sponsor = Struct.new :name, :logo_file, :url


class SponsorList

  attr_reader :sponsors

  def initialize(sponsorslist = nil)
    @sponsors = sponsorslist || default_sponsors
  end


  def sponsor(name)
    @sponsors.find{|o| o.name == name}
  end

  def default_sponsors
    [
      Sponsor.new("Agical", "agical_logo.png", "http://www.agical.se"),
#      Sponsor.new("Dynabyte", "dynabyte_logo.jpg", "http://www.dynabyte.se"),
#      Sponsor.new("Valtech", "valtech_logo.png", "http://www.valtech.se"),
      Sponsor.new("IT-HUSET", 'it-huset_logo.png', "http://www.it-huset.se"),
      Sponsor.new("Assa Abloy", 'assa-abloy_logo.png', "http://www.assaabloy.com/en/com/About-us/Innovation"),
#      Sponsor.new("Solidtango", "solidtango_logo.png", "http://www.solidtango.com"),
#      Sponsor.new("Adaptiv", "adaptiv_logo.png", "http://www.adaptiv.se"),
      Sponsor.new("Citerus", "citerus_logo.png", "http://www.citerus.se"),
#      Sponsor.new("Informator", "informator_logo.png", "http://www.informator.se"),
#      Sponsor.new("Crisp", "crisp_logo.png", "http://www.crisp.se"),
#      Sponsor.new("King", "king_logo.png", "http://www.king.com"),
#      Sponsor.new("Claremont", "claremont_logo.jpg", "http://www.claremont.se"),
#      Sponsor.new("TriOptima", "trioptima_logo.jpg", "http://www.trioptima.com"),
#      Sponsor.new("Mynewsdesk", "mynewsdesk_logo.png", "http://www.mynewsdesk.com")
      # Sponsor.new("Agero", "agero_logo.png", "http://www.agero.se"),
      #Sponsor.new("Avega", "avega_logo.png", "http://www.avegagroup.se"),
      # Sponsor.new("Jaybis", "jaybis_logo.png", "http://www.jaybis.se"),
      # Sponsor.new("Sogeti", "sogeti_logo.png", "http://www.sogeti.se"),
      # Sponsor.new("Attentec", "attentec_logo.png", "http://www.attentec.se"),
      #Sponsor.new("Responsive", "responsive_logo.png", "http://www.responsive.se"),
      # Sponsor.new("CAG", "cag_logo.png", "http://www.cag.se"),
      #Sponsor.new("Omegapoint", "omegapoint_logo.png", "http://www.omegapoint.se"),
      # Sponsor.new("Abiliteam", "abiliteam_logo.png", "http://www.abiliteam.se")
      # Sponsor.new("AddQ", "addq_logo.png", "http://www.addq.se"),
      # Sponsor.new("Know IT", "knowit_logo.png", "http://www.knowit.se"),
      # Sponsor.new("Spotify", "spotify_logo.png", "http://www.spotify.se")
      # Sponsor.new("Scania", "scania_logo.gif", "http://www.scania.se"),
       Sponsor.new("Inceptive", "inceptive_logo.jpg", "http://www.inceptivestockholm.se"),
    ]
  end

  def random_order
    @sponsors.sort_by{rand}
  end

  def randomized_rows(columns=3)
    random_order.in_groups_of(columns, false)
  end
end
