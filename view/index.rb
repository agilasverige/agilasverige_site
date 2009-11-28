module MainView

  class Index < ThreeColumnView

    def main_content
      h2 "Välkommen till en agil konferens om agila metoder!"
      p ''' 

            Hur många gånger har du kommit hem från en konferens och
            konstaterat att de roligaste och mest intressanta samtalen förts i
            fikapauserna? Att det mest inspirerande och lärorika erfarenheterna
            kommer i de möten och diskussioner som inte är styrda av
            programpunkter? Har du inte ofta tänkt att det vore spännande att ta
            de här spontant uppkomna idéerna tillvara och låta fler ta del av dem?
      '''
      p '''
        Fler har tänkt som du, och därför är det fantastiskt
        glädjande att återigen kunna bjuda in till Agila Sverige!
      '''
      p '''
         Det speciella med den här konferensen är dess format, som optimerar
         engagemang, utbyte av erfarenheter och, inte minst, nätverkande.
         Individer och interaktion, med andra ord. Precis som förra året kommer
         förmiddagarna att bestå av blixttal (jfr. Lightning talks) och
         eftermiddagarna av Öppet forum (jfr. Open space) för diskussioner av
         blixttalen  eller andra ämnen. Formatet angavs av många som en stor
         orsak till första årets succé.
      '''
      # h3 do
      #   text "Du kan "
      #   a("delta som talare.", :href => "/attendant/new") 
      # end
      # p '''
      #    Lättrörlig metodik värdesätter högst av allt medarbetaren och
      #    samtalet, och alla besökare ges i enlighet med det möjlighet att bidra
      #    med sina erfarenheter och idéer. Experter och studenter, chefer eller
      #    juniorkonsulter, beställare eller leverantörer – alla infallsvinklar
      #    välkomnas så länge de har en koppling till den lättrörliga metodiken.
      # '''
      # p do
      #   text "Vi tar emot talaranmälningar fram till "
      #   span("fredagen den 15 maj", :class => 'emphasized') 
      # end
      p do
        text "På förmiddagarna hålls så kallade "
        a("blixttal ", :href => "http://en.wikipedia.org/wiki/Lightning_Talks")
        text '''
          som inte får överskrida 10 minuter. Talaren ger sin korta och
          kärnfulla syn på agil metodik eller något relaterat – kanske ett
          verktyg, en erfarenhet eller ett problem. På eftermiddagarna anordnas
          sedan ett så kallat
        '''
        a("Open Space", :href => "http://en.wikipedia.org/wiki/Open_Space_Technology")
        text '''
          , där ambitionen är att haka på några av de tankar som väcks under
          förmiddagens blixttal. På så vis växer konferensens tema fram
          efterhand.
        '''
      end
      p '''
         Agila, eller lättrörliga, metoder vinner alltmer insteg i olika
         utvecklingsprojekt. Vi ser att intresset ökar explosionsartat, såväl
         bland systemutvecklare som beställare.
      '''
      p ''' 
        Den agila konferensformen har etablerat sig ordentligt i Norden i och
        med Smidig 2007/2008. Samt förra årets succékonferens Agila Sverige
        2008. Vi ser fram emot två lika inspirerandedagar i Stockholm i år
        igen.
      '''
      
    end
  end
end

