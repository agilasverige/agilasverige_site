class AS2008View < ThreeColumnView

  attr_writer :presentations


  def initialize(controller, presentations)
    @presentations = presentations
    super(controller)
  end

  def main_content
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

