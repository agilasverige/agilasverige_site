class UsersController < InheritedResources::Base

  before_filter :authenticate_user!
  before_filter :setup_user
  before_filter :authorize_admin!

  def index 
    @users=User.find_for_table(params)
  end

  private

  def setup_user
    if !current_user.admin? || params['id'].blank?
      @user = current_user
    end
  end

  def authorize_admin!
    unless current_user.admin?
      render :file => 'public/404.html', :status => 404
    end
  end
  
end
