# -*- coding: utf-8 -*-
ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end

  section "Antal anmälda" do
    div do
      link_to "#{Conference.current.users.count}", admin_users_path
    end
  end

  section "Antal middagsgäster" do
    div do
      link_to "#{Conference.current.users.where(attending_dinner: true).count}", admin_users_path
    end
  end

  section "Antal talarförslag" do
    div do
      link_to "#{Conference.current.speaking_proposals.count}", admin_speaking_proposals_path
    end
  end

  section "Senaste anmälda" do
    ul do
      Conference.current.users.order("created_at desc").take(10).each do |user|
        li do
          link_to user.full_name, admin_user_path(user)
        end
      end
    end
  end

  section "Senaste talarförslagen" do
    ul do
      Conference.current.speaking_proposals.order("created_at desc").take(10).each do |speaking_proposal|
        li do
          link_to speaking_proposal.title, admin_speaking_proposal_path(speaking_proposal)
        end
      end
    end
  end


  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
