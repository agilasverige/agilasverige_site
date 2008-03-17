class SpeakingProposal < DataMapper::Base

  belongs_to :attendant

  property :accepted, :boolean
  property :title, :string
  property :description, :text
  property :level, :string
  property :created_at, :datetime
end

