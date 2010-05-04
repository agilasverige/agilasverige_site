module FormFields

  def hidden_field(value, id)
    input(:type => 'hidden', :id => id, :name => id, :value => value)
  end

  def text_field(text, label_text, id)
    div(:class => 'field') do
      label(label_text, :for => id, :id => "#{id}_label")
      input(:value => text, :type => 'text', :name => id, :id => id)
    end
  end

  def text_area_field(the_text, label_text, id)
    div(:class => 'field') do
      label(label_text, :for => id, :id => "#{id}_label")
      textarea(:name => id, :id => id) {text the_text}
    end
  end

  def file_field(label_text, id)
    div(:class => 'field') do
      label(label_text, :for => id, :id => "#{id}_label")
      input(:name => id, :id => id, :type => 'file') 
    end
  end

  def checkbox(checked, label_text, id)
    div(:class => 'field') do
      label(label_text, :for => id, :id => "#{id}_label")
      input(:checked => checked, :type => 'checkbox', :value => id, :name => id, :id => id)
    end
  end

  def errors
    if has_errors
      div(:id => 'errors', :class => 'attention') do
        @controller.flash[:error].each do |error|
          p error
        end
      end
    end
  end

  def has_errors
    !@controller.flash[:error].nil?
  end

end
