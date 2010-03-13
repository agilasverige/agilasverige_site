module SpeakingProposalView

  class SpeakingProposalBaseView < TwoColumnView

    include FormFields

    needs :controller, :attendant_uid => '', :speaking_proposal => SpeakingProposal.new

    protected

    def speaking_proposal_fields
      text_field(@speaking_proposal.title, 'Titel', 'title')
      text_area_field(@speaking_proposal.abstract, 'Beskrivning', 'abstract')
      hidden_field(@attendant_uid, 'attendant_uid')
    end
  end


  class New < SpeakingProposalBaseView

    def main_text
      errors
      h2 'Skicka in förslag på blixttal'
      p '''Anmälan av blixttal är personlig, man kan med andra ord inte
      byta ut talaren efter att ett blixttal blivit antaget.'''
      p do
       text 'Allt presentationsmaterial som används måste licensieras under'
       a 'Creative Commons Attribution Share Alike licens', :href => 'http://creativecommons.org/licenses/by-sa/2.5/se/'
       text '. Alla talare kommer att filmas för distribution på nätet.'
      end
      fieldset do
        legend 'Registrera blixttal'
        form(:action => '/speaking_proposal/new', :method => 'post') do
          speaking_proposal_fields
          input(:id => 'submit', :value => 'Anmäl',:type => 'submit')
        end
      end
    end

  end

  # class Edit < AttendantBaseView

  #   needs :attendant

  #   def main_text
  #     errors

  #     p do
  #       a "Anmäl blixttal", 
  #         :id => 'Speaking_lightning_talk', 
  #         :href => "/speaking_proposals/new?uid=#{@attendant.uid}"
  #     end

  #     fieldset do
  #       legend 'Editera deltagare'
  #       form(:action => '/attendant/update', :method => 'post') do
  #         attendant_fields(@attendant)
  #         input(:value => 'Spara', :type => 'Speaking')
  #       end
  #     end
  #   end
  # end

  class Show < SpeakingProposalBaseView

    needs :speaking_proposal, :message => ''


    def main_text
      if @message == 'thanks'
        thanks
      end

      show_speaking_proposal
    end

    private

    def show_speaking_proposal
      p do
        table do
          tr do
            td "Titel"
            td @speaking_proposal.title
          end
          tr do
            td "Beskrivning"
            td @speaking_proposal.abstract
          end
        end
      end
      
    end

    def thanks
      h2 "Tack för din anmälan!"
      p do
        text "Ett bekräftelsemail har skickats till #{@attendant.email}"
      end
    end
  end
end
