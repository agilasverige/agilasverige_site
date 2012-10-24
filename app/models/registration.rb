class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :conference
end
