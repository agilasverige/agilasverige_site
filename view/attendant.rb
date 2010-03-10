module AttendantView
  class AttendantBaseView < TwoColumnView

    include FormFields

    protected

    def speaker_fields(attendant=Attendant.new)
      checkbox(attendant.speaker, 'Vill tala på konferensen', 'wants_to_speak')
      div(:id => 'speakingproposal') do
        text_field(attendant.speaking_proposal.title, 'Titel', 'title')
        text_area_field(attendant.speaking_proposal.abstract, 'Beskrivning', 'abstract')
      end
    end

    def attendant_fields(attendant=Attendant.new)
      hidden_field(attendant.id, 'id')
      text_field(attendant.first_name, 'Förnamn', 'first_name')
      text_field(attendant.last_name, 'Efternamn', 'last_name')
      text_field(attendant.email, 'Email', 'email')
      text_field(attendant.organization, 'Organisation', 'organization')
      text_field(attendant.address, 'Adress', 'address')
      text_field(attendant.zip_code, 'Postnummer', 'zip_code')
      text_field(attendant.postal_address, 'Postadress', 'postal_address')
      text_field(attendant.country,'Land', 'country')
      text_field(attendant.telephone_number, 'Telefonnummer', 'telephone_number')
      checkbox(attendant.attending_dinner, 'Kommer på middagen', 'attending_dinner')
      text_field(attendant.food_preferences, 'Matpreferenser', 'food_preferences')
      text_area_field(attendant.comments, 'Kommentarer', 'comments')
    end

  end

  class New < AttendantBaseView

    def main_text
      errors
      fieldset do
        legend 'Anmälan'
        form(:action => '/attendant/new', :method => 'post') do
          attendant_fields
          input(:value => 'Anmäl',:type => 'submit')
        end
      end
    end

    def local_javascript
      script :type => "text/javascript", :src => "/scripts/signup.js"
    end
  end

  class Edit < AttendantBaseView

    needs :attendant

    def main_text
      errors

      h2 'Blixtal'

      @attendant.speaking_proposals.each do |speaking_proposal|
        p speaking_proposal.title
      end

      p do
        a "Anmäl blixttal", 
          :id => 'submit_lightning_talk', 
          :href => "/speaking_proposal/new?uid=#{@attendant.uid}"
      end

      

      fieldset do
        legend 'Editera deltagare'
        form(:action => '/attendant/update', :method => 'post') do
          attendant_fields(@attendant)
          input(:value => 'Spara', :type => 'submit')
        end
      end
    end
  end

  class Show < ThreeColumnView

    needs :attendant, :message => ''

    def initialize(controller)
      super(controller)
    end

    def content
      if @message == :thanks
        thanks
      end

      show_attendant
    end

    private

    def show_attendant
      
    end

    def thanks
      h2 "Tack för din anmälan!"
      p do
        text "Ett bekräftelsemail har skickats till #{@attendant.email}"
      end
    end
  end


end
