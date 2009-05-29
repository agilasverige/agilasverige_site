module AttendantView
  class AttendantBaseView < ThreeColumnView

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

    def hidden_field(value, id)
      input(:type => 'hidden', :id => id, :name => id, :value => value)
    end

    def text_field(text, label_text, id)
      div(:class => 'field') do
        label(label_text, :for => id, :id => "#{id}_label")
        input(:value => text, :type => 'text', :name => id, :id => id)
      end
    end

    def text_area_field(the_text, label_text, id)
      div(:class => 'field') do
        label(label_text, :for => id, :id => "#{id}_label")
        textarea(:name => id, :id => id) {text the_text}
      end
    end

    def checkbox(checked, label_text, id)
      div(:class => 'field') do
        label(label_text, :for => id, :id => "#{id}_label")
        input(:checked => checked, :type => 'checkbox', :name => id, :id => id)
      end
    end

    def errors
      if has_errors
        div(:id => 'errors', :class => 'attention') do
          self.controller.flash[:error].each do |error|
            p error
          end
        end
      end
    end

    def has_errors
      !self.controller.flash[:error].nil?
    end
  end

  class New < AttendantBaseView

    def initialize(controller)
      super(controller)
    end

    def content
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

    def initialize(controller, attendant)
      @attendant = attendant
      super(controller)
    end

    def content
      errors

      fieldset do
        legend 'Editera deltagare'
        form(:action => '/attendant/update', :method => 'post') do
          attendant_fields(@attendant)
          speaker_fields(@attendant)
          input(:value => 'Spara', :type => 'submit')
        end
      end
    end
  end

  class Show < ThreeColumnView

    attr_writer :attendant, :message

    def initialize(controller)
      super(controller)
    end

    def content
      if @message == 'thanks'
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
