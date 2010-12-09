class SpeakingProposal 

  include Mongoid::Document

  references_many :speakers, :stored_as => :array, :inverse_of => :speaking_proposals

  field :title
  field :abstract

end

