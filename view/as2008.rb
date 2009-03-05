class AS2008View < BaseView

  attr_writer :presentations

  def initialize(presentations)
    @presentations = presentations
    super
  end

  def content
    ul(:id => 'presentations') do
      @presentations.each do |presentation|
        li "#{presentation.title}, #{presentation.author}" 
        presentation.files.each do |file|
          a :href => "/files/presentations_08/#{file}", :id => file.sub(/\./, '_') do
            img :src => "/images/#{file_icon(file)}"
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

