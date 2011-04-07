class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :sponsors

  layout 'three_columns'

  private

  def sponsors
    @sponsors = SponsorList.new
  end
end
