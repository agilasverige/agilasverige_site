class SpeakingProposal < DataMapper::Base

  belongs_to :attendant

  property :accepted, :boolean
  property :title, :string
  property :description, :text
  property :level, :string
  property :created_at, :datetime

  def attendant_full_name
    attendant.full_name
  end

  def attendant_organization
    attendant.organization
  end
end

