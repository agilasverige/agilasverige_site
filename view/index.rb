class MainView < BaseView

  def content
    h2 'Datumen för Agila Sverige 2009 är klara'
    p do
      text 'Förra årets mest uppskattade konferens om agil systemutveckling är tillbaka! I år går den av stapeln 8-9 juni på Ingenjörshuset i Stockholm.' 
    end
    p 'Precis som förra året kommer konferensen att bestå av tio-minuters blixttal på förmiddagarna med uppföljande Open Space på eftermiddagarna.'
    p 'Det kommer snart att vara möjligt att anmäla sig både som talare och deltagare. Precis som förra året kommer talare att gå gratis samtidigt som avgiften för deltagare är högst överkomlig.'
    p do 
      text 'Under tiden kan man - äntligen - ta del av '
      a 'förra årets konferens', :href => '/2008'
      text '.'
    end
  end
end

