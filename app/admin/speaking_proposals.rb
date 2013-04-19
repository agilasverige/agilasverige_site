ActiveAdmin.register SpeakingProposal do

  index do
    column :title
    column :abstract
    column :speaker do |proposal|
      link_to proposal.registration.user.full_name, admin_speaking_proposal_path(proposal)
    end

  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :abstract
      f.input :booked_day1
      f.input :booked_day2
    end
  end

end
