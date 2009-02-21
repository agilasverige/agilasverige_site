class SpeakingProposal 
# include DataMapper::Resource

# belongs_to :attendant

# property :id, Integer, :serial => true
# property :accepted, Boolean
# property :title, String
# property :description, Text
# property :level, String
# property :created_at, DateTime

  def attendant_full_name
    attendant.full_name
  end

  def attendant_organization
    attendant.organization
  end
end

