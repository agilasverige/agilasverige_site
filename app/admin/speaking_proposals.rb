ActiveAdmin.register SpeakingProposal do

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :abstract
      f.input :booked_day1
      f.input :booked_day2
    end
  end
end
