class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :sponsors

  layout 'three_columns'

  private

  def after_sign_in_path_for(user)
    root_path
  end

  def sponsors
    @sponsors = SponsorList.new
  end
end
