module SpeakingProposalView

  class SpeakingProposalBaseView < TwoColumnView

    include FormFields

    protected

    def speaking_proposal_fields(speaking_proposal=SpeakingProposal.new, attendant_uid='')
      legend
      text_field(speaking_proposal.title, 'Titel', 'title')
      text_area_field(speaking_proposal.abstract, 'Beskrivning', 'abstract')
      hidden_field(attendant_uid, 'attendant_uid')
    end
  end


  class New < SpeakingProposalBaseView

    needs :attendant_uid => ''

    def main_text
      errors
      fieldset do
        legend 'Registrera blixttal'
        form(:action => '/speaking_proposal/new', :method => 'post') do
          speaking_proposal_fields
          input(:id => 'submit', :value => 'Anmäl',:type => 'submit')
        end
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

  # class Show < ThreeColumnView

  #   attr_writer :attendant, :message

  #   def initialize(controller)
  #     super(controller)
  #   end

  #   def content
  #     if @message == 'thanks'
  #       thanks
  #     end

  #     show_attendant
  #   end

  #   private

  #   def show_attendant
  #     
  #   end

  #   def thanks
  #     h2 "Tack för din anmälan!"
  #     p do
  #       text "Ett bekräftelsemail har skickats till #{@attendant.email}"
  #     end
  #   end
  # end

