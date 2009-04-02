class AttendantNew < BaseView 

  def content
    form(:action => '/attendant/new', :method => 'post') do
      text_field('Förnamn', 'first_name')
      text_field('Efternamn', :last_name)
      text_field('Organisation', 'organization')
      text_field('Adress', 'address')
      text_field('Postnummer', 'zip_code')
      text_field('Postadress', 'postal_address')
      text_field('Land', 'country')
      checkbox('Kommer på middagen', 'attending_dinner')
      text_field('Matpreferenser', 'food_preferences')
      text_area_field('Kommentarer', 'comments')
      input(:value => 'Anmäl',:type => 'submit')
    end
  end

  private

  def text_field(label_text, id)
    label(label_text, :for => id, :id => "#{id}_label")
    input(:type => 'text', :name => id, :id => id)
  end

  def text_area_field(label_text, id)
    label(label_text, :for => id, :id => "#{id}_label")
    textarea(:name => id, :id => id)
  end

  def checkbox(label_text, id)
    label(label_text, :for => id, :id => "#{id}_label")
    input(:type => 'checkbox', :name => id, :id => id)
  end
end
