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
      # Sponsor.new("Dynabyte", "dynabyte_logo.jpg", "http://www.dynabyte.se"),
      # Sponsor.new("AddQ", "addq_logo.png", "http://www.addq.se"),
      # Sponsor.new("Valtech", "valtech_logo.png", "http://www.valtech.se"),
      # Sponsor.new("Agero", "agero_logo.png", "http://www.agero.se"),
      Sponsor.new("Solidtango", "solidtango_logo.png", "http://www.solidtango.com"),
      # Sponsor.new("Avega", "avega_logo.png", "http://www.avegagroup.se"),
      # Sponsor.new("Jaybis", "jaybis_logo.png", "http://www.jaybis.se"),
      # Sponsor.new("Adaptiv", "adaptiv_logo.png", "http://www.adaptiv.se"),
      # Sponsor.new("Sogeti", "sogeti_logo.png", "http://www.sogeti.se"),
      # Sponsor.new("Attentec", "attentec_logo.png", "http://www.attentec.se"),
      # Sponsor.new("Citerus", "citerus_logo.png", "http://www.citerus.se"),
      # Sponsor.new("Responsive", "responsive_logo.png", "http://www.responsive.se"),
      # Sponsor.new("CAG", "cag_logo.png", "http://www.cag.se"),
      # Sponsor.new("Omegapoint", "omegapoint_logo.png", "http://www.omegapoint.se")
      # Sponsor.new("Abiliteam", "abiliteam_logo.png", "http://www.abiliteam.se")
      # Sponsor.new("Informator", "informator_logo.png", "http://www.informator.se"),
      # Sponsor.new("Crisp", "crisp_logo.png", "http://www.crisp.se")
      # Sponsor.new("Know IT", "knowit_logo.png", "http://www.knowit.se"),
      # Sponsor.new("Spotify", "spotify_logo.png", "http://www.spotify.se"),
      # Sponsor.new("Scania", "scania_logo.gif", "http://www.scania.se"),
    ]
  end
  
  def random_order
    @sponsors.sort_by{rand}
  end

  def in_three_random_groups
    sponsors = random_order

    base, rest = sponsors.size.divmod(3)

    first_group_size = base + (rest > 0 ? 1 : 0)
    second_group_size = base + (rest > 1 ? 1 : 0)
    third_group_size = base

    first_break = first_group_size - 1
    second_break = first_group_size + second_group_size - 1

    first_group = sponsors[0..first_break]
    second_group = sponsors[(first_break + 1)..second_break]
    third_group = sponsors[(second_break + 1)..(sponsors.size - 1)]

    [ first_group, second_group, third_group ]

  end

  private


end
