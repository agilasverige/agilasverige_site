module PreviousConferences
  class PreviousConferencesView < ThreeColumnView
  
    needs :presentations

    protected

    def submenu_items
      [['2008', '/previous_conferences/zeroeight']]
    end
    
  end

  class ZeroEight < PreviousConferencesView

    attr_writer :presentations


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
end
