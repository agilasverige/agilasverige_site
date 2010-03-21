module AdminView
  class Attendants < TwoColumnView 

    needs :attendants

    def main_text
      h2 'Deltagare'
      table do
        tr do
          th 'Efternamn'
          th 'Förnamn'
          th 'Organisation'
          th 'Talare'
          th 'Middag'
          th 'Anmälningsdatum'
        end
        @attendants.each do |attendant|
          tr do
            td do
              a(attendant.last_name, :href => "/attendant/#{attendant.id}")
            end
            td attendant.first_name
            td attendant.organization
            td attendant.speaking_proposals.size > 0
            td attendant.attending_dinner
            td attendant.created_at
          end
        end
      end
    end
  end

  class SpeakingProposals < TwoColumnView 

    needs :speakers

    def main_text
      h2 'Talare'
      table do
        tr do
          th 'Efternamn'
          th 'Förnamn'
          th 'Titel'
          th 'Abstract'
        end
        @speakers.each do |speaker|
          tr do
            td speaker.last_name
            td speaker.first_name
            td speaker.speaking_proposal.title
            td speaker.speaking_proposal.abstract
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
