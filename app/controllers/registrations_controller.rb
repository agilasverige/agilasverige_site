# coding: utf-8
class RegistrationsController < InheritedResources::Base

  before_filter :authenticate_user!
  before_filter :authorize_admin!, :only => [:index, :show, :update_comment]

  def index
    @conference = Conference.current
    if params[:conference_id]
      @conference = Conference.find(params[:conference_id])
    end
    @registrations = @conference.registrations
    render :layout => 'admin'
  end

  def show
    @registration = Registration.find(params[:id])
  end

  def update_comment
    unless current_user && current_user.admin?
      render '/public/404.html', :status => 404
    else
      @registration = Registration.find(params[:id])
      @registration.update_attributes!(params[:registration])
      redirect_to users_path
    end
  end

  def authorize_admin!
    unless current_user.admin?
      render :file => 'public/404.html', :status => 404
    end
  end

end
