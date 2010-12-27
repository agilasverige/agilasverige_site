class EditableContentController < InheritedResources::Base

  def update
    update!{ eval "#{@editable_content.page_name}_path" }
  end
end
