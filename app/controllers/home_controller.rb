class HomeController < ApplicationController

  def show

    @content = ''

    static = EditableContent.first(:conditions => {:page_name => 'home'})
    if static
      @content = static.content
    end
  end

  def edit
    @content = EditableContent.find_or_create_by_page_name('home')
    render layout: 'edit'
  end

end
