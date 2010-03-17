module PreviousConferences
  class PreviousConferencesView < ThreeColumnView
  

    protected

    def submenu_items
      [['2008', '/previous_conferences/zeroeight'],
      ['2009', '/previous_conferences/zeronine']]
    end
    
  end

  class ZeroEight < PreviousConferencesView

    needs :presentations

    def main_text
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

  class ZeroNine < PreviousConferencesView

    def main_text
      p do
        a 'Videoupptagningar från Agila Sverige 2009', :href => 'http://www.vimeo.com/user2794604'
      end
      p do
        a 'Presentationerna', :href => 'http://www.slideshare.net/event/agila-sverige-2009'
      end
    end
  end
end
