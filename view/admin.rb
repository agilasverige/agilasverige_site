module AdminView
  class Attendants < TwoColumnView 

    needs :attendants

    def main_text
      h2 "Deltagare: #{@attendants.size}"
      table do
        tr do
          th 'Efternamn'
          th 'Förnamn'
          th 'Fakturaadress'
          th 'Talare'
          th 'Middag'
          th 'Matprefs'
          th 'Anmälningsdatum'
        end
        @attendants.each do |attendant|
          status = (attendant.unregistered? ? 'unregistered' : '')
          tr do
            td :class  => status do
              a(attendant.last_name, :href => "/attendant/#{attendant.uid}")
            end
            td :class => status do
              text attendant.first_name
            end
            td :class  => status do 
              br
              attendant.organization 
              br
              attendant.address
              br
              attendant.zip_code
              br
              attendant.postal_address
              br
              attendant.invoice_reference
            end
            td attendant.speaking_proposals.size > 0, :class => status
            td attendant.attending_dinner, :class => status
            td attendant.food_preferences, :class => status
            td attendant.created_at, :class => status
          end
        end
      end
    end
  end

  class SpeakingProposals < TwoColumnView 

    needs :speakers

    def main_text
      h2 'Talarförslag'
      table do
        tr do
          th 'Id'
          th 'Talare'
          th 'Titel'
          th 'Abstract'
          th 'Fil'
        end
        @speakers.each do |speaker|
          speaker.speaking_proposals.each do |speaking_proposal|
            tr do
              td speaking_proposal.id
              td speaker.full_name
              td speaking_proposal.title
              td speaking_proposal.abstract
              td do
                a speaking_proposal.filename, :href => "/files/presentations10/#{speaking_proposal.filename}"
              end
            end
          end
        end
      end
    end
  end

  class Speakers < TwoColumnView 

    needs :speakers

    def main_text
      h2 'Talare'
      table do
        tr do
          th 'Talare'
          th 'Email'
        end
        @speakers.each do |speaker|
          tr do
            td speaker.full_name
            td speaker.email
          end
        end
      end
    end
  end

  class Email < TwoColumnView

    include FormFields

    def main_text
      fieldset do
        legend 'Nytt email till alla deltagare'
        form(:action => '/admin/email/new', :method => 'post') do
          text_field('', 'Ämne', 'subject')
          text_area_field('', 'Emailtext', 'email_body')
          input(:value => 'Skicka', :type => 'submit')
        end
      end
    end
  end

end
