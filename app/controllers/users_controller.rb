class UsersController < InheritedResources::Base

  before_filter :authenticate_user!
  before_filter :setup_user

  private

  def setup_user
    if !current_user.admin? || params['id'].blank?
      @user = current_user
    end
  end
  
end
