class DashboardController < ApplicationController

  def show
    unless current_user && current_user.admin?
      render '/public/404.html', :status => 404
    else
      @conference = Conference.current
      if params[:conference_id]
        @conference = Conference.find(params[:conference_id])
      end

      @users_count = @conference.users.count
      @users_created_today = @conference.users.created_today
      @users_last_five =  @conference.users.last_five
      @users_count_created_by_date = @conference.users.created_by_date

      @speaking_proposals_count = @conference.speaking_proposals.count
      @speaking_proposals_created_today = @conference.speaking_proposals.created_today
      @speaking_proposals_last_five =  @conference.speaking_proposals.last_five
      @speaking_proposals_count_created_by_date = @conference.speaking_proposals.created_by_date

      @user_signup_chart  = chart(@users_count_created_by_date)
      @speaking_proposal_signup_chart  = chart(@speaking_proposals_count_created_by_date)
    end
  end

  private

  def chart(count_by_date)
    GoogleChart::LineChart.new('500x200', nil, false) do |sparklines|
      sparklines.data "Deltagare", count_by_date.values
      sparklines.show_legend = true
      sparklines.axis :x, :labels => count_by_date.keys
      sparklines.axis :y, :range  =>  [0,count_by_date.values.max]
      puts sparklines.to_url
    end
  end

end

