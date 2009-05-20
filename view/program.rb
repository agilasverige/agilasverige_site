module ProgramView
  class Index < BaseView
    def content
      h1 'Måndag'
      div(:id => 'test', :style => 'display: none;')  do
        p 'hej'
      end
      table do
        tr do
          th 'Tid'
          th 'Celsiussalen'
          th 'Polhemsalen'
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
            '09:00 - 10:00'
          end
          td  do
            p(:class => 'title') do
              'Introduktion'
            end
          end
          td do
            p(:class => 'title') do 
              'Introduktion'
            end
          end
        end
        tr do
          td  do
            talkinfo
          end
          td  do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td  do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td '10:00 - 10:20'
          td(:class => 'paus', :colspan => '2') do 'Kaffepaus' end
        end
        tr do
          td do
            '10:20 - 11:20'
          end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do '11:20 - 11:30' end
          td(:class => 'paus', :colspan => '2') do 'Paus' end
        end
        tr do
          td do '11:30 - 12:30' end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td  do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td  do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do '12:30 - 13:30' end
          td(:class => 'paus', :colspan => '2') do 'Lunch' end
        end
        tr do
          td do '13:30 - 14:15' end
          td(:class => 'paus', :colspan => '2') do  'Open Space inledning' end
        end
        tr do
          td do '14:15 - 15:00' end
          td(:class => 'paus', :colspan => '2') do 'Open Space' end
        end
        tr do
          td do '15:15 - 16:00' end
          td(:class => 'paus', :colspan => '2') do 'Open Space' end
        end
        tr do
          td do '16:15 - 17:00' end
          td(:class => 'paus', :colspan => '2') do 'Open Space' end
        end
      end
      h1 'Tisdag'
      table do
        tr do
          th 'Tid'
          th 'Celsiussalen'
          th 'Polhemssalen'
        end
        tr do
          td do '09:00 - 10:00' end
          td  do
            talkinfo
          end
          td  do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do '10:00 - 10:20' end
          td(:class => 'paus', :colspan => '2') do 'Kaffepaus' end
        end
        tr do
          td do '10:20 - 11:20' end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td  do
            talkinfo
          end
        end
        tr do
          td do end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end
        end
        tr do
          td do '11:20 - 11:30' end
          td(:class => 'paus', :colspan => '2') do 'Paus' end
        end
        tr do
          td do '11:30 - 12:30' end
          td  do
            talkinfo
          end
          td do
            talkinfo
          end 
      end
      tr do
        td do end
        td do
          talkinfo
        end
        td do
          talkinfo
        end
      end
      tr do
        td do end
        td do
          talkinfo
        end
        td do
          talkinfo
        end
      end
      tr do
        td do end
        td do
          talkinfo
        end
        td do
          talkinfo
        end
      end
      tr do
        td do end
        td do
          talkinfo
        end
        td do
          talkinfo
        end
      end
      tr do
        td '12:30 - 13:30'
        td(:class => 'paus', :colspan => '2') do 'Lunch' end
      end
      tr do
        td '13:30 - 14:00'
        td(:class => 'paus', :colspan => '2') do 'Open Space inledning' end
      end
      tr do
        td '14:00 - 14:45'
        td(:class => 'paus', :colspan => '2') do 'Open Space' end
      end
      tr do
        td '15:00 - 15:45'
        td(:class => 'paus', :colspan => '2') do 'Open Space' end
      end
      tr do
        td '16:00 - 16:45'
        td(:class => 'paus', :colspan => '2') do 'Avslutning' end
      end
    end
    end

    def talkinfo


      p(:class => 'title') do
        text 'title'
      end
      p(:class => 'speaker') do 
        text 'speaker - organization'
          div(:id => 'idd', :style => 'display: none;')
          p do
            text 'info'
          end
      end
    end
  end
end
