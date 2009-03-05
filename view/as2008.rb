class AS2008View < BaseView

  attr_writer :presentations

  def content
    ul(:id => 'talks') do
      @presentations.each do |presentation|
        li "#{presentation.title}, #{presentation.author}" 
        presentation.files.each do |file|
          a file, :href => "/files/presentations_08/#{file}"
        end
      end
    end
  end
end

