class UsersController < InheritedResources::Base

  before_filter :authenticate_user!, :except => :show

  def edit
    if user_signed_in?
      @user = current_user
    else
      render '404.html'
    end
  end
  
end
