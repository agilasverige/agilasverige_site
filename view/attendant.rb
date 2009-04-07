module AttendantView
  class New < BaseView 

    def initialize(controller)
      super(controller)
    end

    def content
      fieldset do
        legend 'Anmälan'
        form(:action => '/attendant/new', :method => 'post') do
          text_field('Förnamn', 'first_name')
          text_field('Efternamn', 'last_name')
          text_field('Email', 'email')
          text_field('Organisation', 'organization')
          text_field('Adress', 'address')
          text_field('Postnummer', 'zip_code')
          text_field('Postadress', 'postal_address')
          text_field('Land', 'country')
          checkbox('Kommer på middagen', 'attending_dinner')
          text_field('Matpreferenser', 'food_preferences')
          text_area_field('Kommentarer', 'comments')
          checkbox('Vill tala på konferensen', 'wants_to_speak')
          div(:id => 'speakingproposal') do
            text_field('Titel', 'title')
            text_area_field('Beskrivning', 'abstract')
          end
          input(:value => 'Anmäl',:type => 'submit')
        end
      end
    end

    def javascript
      rawtext <<-END
        <script type="text/javascript" src="/scripts/signup.js"></script>
      END
    end

    private

    def text_field(label_text, id)
      div(:class => 'field') do
        label(label_text, :for => id, :id => "#{id}_label")
        input(:type => 'text', :name => id, :id => id)
      end
    end

    def text_area_field(label_text, id)
      div(:class => 'field') do
        label(label_text, :for => id, :id => "#{id}_label")
        textarea(:name => id, :id => id)
      end
    end

    def checkbox(label_text, id)
      div(:class => 'field') do
        label(label_text, :for => id, :id => "#{id}_label")
        input(:type => 'checkbox', :name => id, :id => id)
      end
    end

  end

  class Show < BaseView

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
