class MainView < BaseView

  def content
    h2 'Agila Sverige 2008 är över, vi syns nästa år!'
    p do
      img :src => "http://farm4.static.flickr.com/3185/2634605105_7eccf1b1ba.jpg"
      text 'Närmare 140 deltagare kom till Ingenjörshuset i Stockholm för att lyssna och diskutera agil systemutveckling. Konferensen var en stor succé med många mycket nöjda deltagare.'
    end
    p 'Agila Sverige 2009 är redan i planeringsstadiet och kommer att vara i Stockholm vid ungefär samma tid nästa år'
    p do
      text 'Men under tiden vill vi gärna tipsa om '
      a 'Smidig 2008', :href => "http://www.smidig2008.no"
      text ' i Oslo.'
    end
  end
end

