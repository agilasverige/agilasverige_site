module AdminView
  class Attendants < BaseView 

    def initialize(controller, attendants)
      @attendants = attendants
      super(controller)
    end

    def content
      h2 'Deltagare'
      table do
        tr do
          th 'Efternamn'
          th 'Förnamn'
          th 'Organisation'
          th 'Talare'
          th 'Middag'
        end
        @attendants.each do |attendant|
          tr do
            td do
              a(attendant.last_name, :href => "/attendant/edit/#{attendant.id}")
            end
            td attendant.first_name
            td attendant.organization
            td attendant.speaker
            td attendant.attending_dinner
          end
        end
      end
    end
  end

  class SpeakingProposals < BaseView 

    def initialize(controller, speakers)
      @speakers = speakers
      super(controller)
    end

    def content
      h2 'Talare'
      table do
        tr do
          th 'Efternamn'
          th 'Förnamn'
          th 'Titel'
          th 'Abstract'
        end
        @speakers.each do |speaker|
          puts speaker.inspect
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
end
