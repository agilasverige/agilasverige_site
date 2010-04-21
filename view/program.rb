module ProgramView
  class Index < TwoColumnView

    needs :schedule, :sessions

    def main_text
      @sessions.each do |session|
        Ramaze::Log.debug session.id
      end
      Ramaze::Log.debug @schedule.inspect
      h1 'Måndag'
      div(:id => 'test', :style => 'display: none;')  do
        p 'hej'
      end
      table do
        tr do
          th 'Tid'
          th 'Polhemsalen'
          th 'Celsiussalen'
        end
        tr do
          td do
            p '08:00 - 09:00'
          end
          td(:id => 'registration', :colspan => '2') do
            p 'Registrering'
          end
        end
        tr do
          td do 
            text '09:00 - 09:10'
          end
          td  do
            p(:class => 'title') do
              text 'Introduktion'
            end
          end
          td do
            p(:class => 'title') do 
              text 'Introduktion'
            end
          end
        end
        Schedule::MONDAY_SLOTS[0..3].each do |slot|
          tr do
            td slot
            td  do
              talkinfo(@schedule.monday.slot_at(slot)[0])
            end
            td  do
              talkinfo(@schedule.monday.slot_at(slot)[1])
            end
          end
        end
        tr do
          td '10:00 - 10:20'
          td(:class => 'paus', :colspan => '2') do text 'Kaffepaus' end
        end
        Schedule::MONDAY_SLOTS[4..8].each do |slot|
          tr do
            td slot
            td  do
              talkinfo(@schedule.monday.slot_at(slot)[0])
            end
            td  do
              talkinfo(@schedule.monday.slot_at(slot)[1])
            end
          end
        end
        tr do
          td do text '11:20 - 11:30' end
          td(:class => 'paus', :colspan => '2') do text 'Paus' end
        end
        Schedule::MONDAY_SLOTS[9..13].each do |slot|
          tr do
            td slot
            td  do
              talkinfo(@schedule.monday.slot_at(slot)[0])
            end
            td  do
              talkinfo(@schedule.monday.slot_at(slot)[1])
            end
          end
        end
        tr do
          td do text '12:30 - 13:30' end
          td(:class => 'paus', :colspan => '2') do text 'Lunch' end
        end
        tr do
          td do text '13:30 - 14:15' end
          td(:class => 'paus', :colspan => '2') do  text 'Open Space inledning' end
        end
        tr do
          td do text '14:15 - 15:00' end
          td(:class => 'paus', :colspan => '2') do text 'Open Space' end
        end
        tr do
          td do text '15:15 - 16:00' end
          td(:class => 'paus', :colspan => '2') do text 'Open Space' end
        end
        tr do
          td do text '16:15 - 17:00' end
          td(:class => 'paus', :colspan => '2') do text 'Open Space' end
        end
      end
      h1 'Tisdag'
      table do
        tr do
          th 'Tid'
          th 'Polhemssalen'
          th 'Celsiussalen'
        end
        Schedule::TUESDAY_SLOTS[0..4].each do |slot|
          tr do
            td slot
            td  do
              talkinfo(@schedule.tuesday.slot_at(slot)[0])
            end
            td  do
              talkinfo(@schedule.tuesday.slot_at(slot)[1])
            end
          end
        end
        tr do
          td do text '10:00 - 10:20' end
          td(:class => 'paus', :colspan => '2') do text 'Kaffepaus' end
        end
        Schedule::TUESDAY_SLOTS[5..9].each do |slot|
          tr do
            td slot
            td  do
              talkinfo(@schedule.tuesday.slot_at(slot)[0])
            end
            td  do
              talkinfo(@schedule.tuesday.slot_at(slot)[1])
            end
          end
        end
        tr do
          td do text '11:20 - 11:30' end
          td(:class => 'paus', :colspan => '2') do text 'Paus' end
        end
        Schedule::TUESDAY_SLOTS[10..14].each do |slot|
          tr do
            td slot
            td  do
              talkinfo(@schedule.tuesday.slot_at(slot)[0])
            end
            td  do
              talkinfo(@schedule.tuesday.slot_at(slot)[1])
            end
          end
        end
        tr do
          td '12:30 - 13:30'
          td(:class => 'paus', :colspan => '2') do text 'Lunch' end
        end
        tr do
          td '13:30 - 14:00'
          td(:class => 'paus', :colspan => '2') do text 'Open Space inledning' end
        end
        tr do
          td '14:00 - 14:45'
          td(:class => 'paus', :colspan => '2') do text 'Open Space' end
        end
        tr do
          td '15:00 - 15:45'
          td(:class => 'paus', :colspan => '2') do text 'Open Space' end
        end
        tr do
          td '16:00 - 16:45'
          td(:class => 'paus', :colspan => '2') do text 'Avslutning' end
        end
      end
    end

    def talkinfo(id = '')
      session = find_session(id)
      p(:class => 'title') do
        a(:class => 'fancybox', :title => proposal_title(session), :href => "\##{id}") do
          text !session.nil? ? session.title : 'unknown'
        end
      end
      p(:class => 'speaker') do 
        text "#{!session.nil? ? session.speaker.full_name : 'unknown'} - #{!session.nil? ? session.speaker.organization : 'unknown'}"
      end
      div(:id => id, :class => 'hidden') do
        p !session.nil? ? session.abstract : 'unknown'
        p(:class => 'speaker') do
          text 'Talare är '
          text "#{!session.nil? ? session.speaker.full_name : 'unknown'} från #{!session.nil? ? session.speaker.organization : 'unknown'}"
        end
      end
    end

    def proposal_title(session)
      !session.nil? ? session.title : 'unknown'
    end

    def find_session(id)
      Ramaze::Log.debug "id: #{id}"

      @sessions.find do |candidate|
        candidate.id.to_s == id
      end
    end

    def local_javascript
      script(:type => "text/javascript", :src => "/scripts/jquery-1.3.2.min.js"){}
      script(:type => "text/javascript", :src => "/fancybox/jquery.fancybox-1.2.1.pack.js"){}
      script(:type => "text/javascript", :src => "/scripts/program.js"){}
    end

    def css
      link :rel => "stylesheet", :href => "/fancybox/jquery.fancybox.css", :type => "text/css", :media => "screen"
    end      
  end
end
