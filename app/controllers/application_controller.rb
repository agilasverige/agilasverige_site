class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :sponsors

  private

  def sponsors
    @sponsors = SponsorList.new
  end
end
