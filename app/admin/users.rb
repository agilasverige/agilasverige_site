ActiveAdmin.register User do

  config.sort_order = "updated_at_desc"

  index do
    column :first_name
    column :last_name
    column :email
    column :organization
    column :attending_dinner
    column :food_preferences
    column :created_at
    column :updated_at
    column :invoice_reference
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :organization
      f.input :attending_dinner
      f.input :food_preferences
      f.input :comments
    end
    f.buttons
  end


end
