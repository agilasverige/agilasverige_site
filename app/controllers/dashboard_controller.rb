class DashboardController < ApplicationController

  def show
    unless current_user && current_user.admin?
      render '/public/404.html', :status => 404
    end

    @users_count = User.count
    @users_created_today = User.created_today
    @users_last_five =  User.last_five
    @users_count_created_by_date = User.created_by_date

    @speaking_proposals_count = SpeakingProposal.count
    @speaking_proposals_created_today = SpeakingProposal.created_today
    @speaking_proposals_last_five =  SpeakingProposal.last_five
    @speaking_proposals_count_created_by_date = SpeakingProposal.created_by_date

  end

end
