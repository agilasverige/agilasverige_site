class DashboardController < ApplicationController

  def show
    unless current_user && current_user.admin?
      render '/public/404.html', :status => 404
    end

  end

end
