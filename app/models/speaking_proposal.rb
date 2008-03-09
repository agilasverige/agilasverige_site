class SpeakingProposal < DataMapper::Base
  property :title, :string
  property :description, :text
  property :level, :string
end