ActiveAdmin.register SpeakingProposal do

  index do
    column :title do |proposal|
      link_to proposal.title, admin_speaking_proposal_path(proposal)
    end
    column :abstract
    column :speaker do |proposal|
      link_to proposal.registration.user.full_name, admin_user_path(proposal.registration.user)
    end
    column :year do |p|
      p.registration.conference.year.to_s
    end
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :abstract
      f.input :booked_day1
      f.input :booked_day2
    end
  end

  csv do
    column :title
    column :abstract
    column("speaker") {|p| p.registration.user.full_name}
    column :year do |p|
      p.registration.conference.year.to_s
    end
  end

end
