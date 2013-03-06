class HomeController < ApplicationController

  def show

    @content = ''

    static = EditableContent.first(:conditions => {:page_name => 'home'})
    if static
      @content = static.content
    end

    @user = User.new
    @registration_status = PaysonClient.load_registration_status(current_user)
  end

  def edit
    @content = EditableContent.find_or_create_by_page_name('home')
    render layout: 'edit'
  end
end
