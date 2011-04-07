require 'csv'

class UsersController < InheritedResources::Base

  before_filter :authenticate_user!
  before_filter :setup_user
  before_filter :authorize_admin!, :only => [:index]

  def index 
    respond_to do |format|
      format.html do
        @users=User.find_for_table(params)
        render :layout => 'admin'
      end
      format.csv do
        @users  = User.all
        csv =CSV.generate(:col_sep => ",") do |csv| 
          @users.each do |user|
            csv << [user.last_name,
                    user.first_name,
                    user.organization,
                    user.address,
                    user.zip_code,
                    user.postal_address,
                    user.country,
                    user.invoice_reference,
                    user.telephone_number,
                    user.attending_dinner,
                    user.food_preferences,
                    user.comments,
                    user.email]
          end
        end
        render :text => csv
      end
    end
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
