module PreviousConferences
  class PreviousConferencesView < ThreeColumnView


    protected

    def submenu_items
      [['2010', '/previous_conferences/onezero'],
      ['2009', '/previous_conferences/zeronine'],
      ['2008', '/previous_conferences/zeroeight']]
    end

  end

  class OneZero < PreviousConferencesView

    def main_text
      h1 'Agila Sverige 2010'
      p do
        a 'Presentationsmaterial', :href => 'http://www.slideshare.net/event/agila-sverige-2010/slideshows'
        text ' från Agila Sverige 2010'
      end
    end
  end

  class ZeroNine < PreviousConferencesView

    def main_text
      h1 'Agila Sverige 2009'
      p do
        a 'Videoupptagningar', :href => 'http://www.vimeo.com/user2794604'
        text ' och '
        a 'presentationsmaterial', :href => 'http://www.slideshare.net/event/agila-sverige-2009/slideshows'
        text ' från Agila Sverige 2009'
      end
    end
  end

  class ZeroEight < PreviousConferencesView

    needs :presentations

    def main_text
      h1 'Agila Sverige 2008'
      table(:id => 'presentations') do
        tr do
          th "Titel"
          th 'Talare'
          th 'Filer'
        end
        @presentations.each do |presentation|
          tr do 
            td "#{presentation.title}"
            td "#{presentation.author}" 
            td do
              presentation.files.each do |file|
                a :href => "/files/presentations_08/#{file}", :id => file.sub(/\./, '_') do
                  img :src => "/images/#{file_icon(file)}"
                end
              end
            end
          end
        end
      end
    end

    private

    def file_icon(filename)
      suffix = filename[-3,3]
      return "#{suffix}icon.gif"
    end

  end

end
