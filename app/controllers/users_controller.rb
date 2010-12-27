class UsersController < InheritedResources::Base


  def edit
    if user_signed_in?
      @user = current_user
    else
      render '404.html'
    end
  end
  
end
