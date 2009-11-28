module MainView

  class Index < ThreeColumnView

    def main_content
      h2 "Välkommen till en agil konferens om agila metoder!"
      p ''' 
        Årets upplaga av Agila Sverige lämnade oss återigen med en positiv bild
        av hur agil systemutveckling har tagit plats i Sverige.Vi arrangörer
        vill tacka dig som var med och gjorde konferensen till en succé, Ett
        Net Promoter Score <http://en.wikipedia.org/wiki/Net_Promoter> på 84%
        talar sitt tydliga språk tycker vi
      '''
      p '''
        Inom kort kommer både filmer från talen och presentationer kommer att
        dyka upp.
      '''
      p '''
        Vi vill också återigen tacka våra sponsorer som gör så att priset kan
        hållas så lågt.  Vi skapar tillsammans en högkvalitativ konferens och
        våra sponsorer gör den tillgänglig.
      '''
      p " Vi ses igen nästa år! "
      p "Trevlig sommar önskar arrangörerna,"
      p "Anders, Joakim, Jocke, Marcus, Matti, Måns, Ola och Rasmus"
    end
  end
end

