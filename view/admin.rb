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
            td attendant.last_name
            td attendant.first_name
            td attendant.organization
            td attendant.speaker
            td attendant.attending_dinner
          end
        end
      end
    end
  end

end
