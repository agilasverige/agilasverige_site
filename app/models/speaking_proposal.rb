class SpeakingProposal 

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validations


  references_many :speakers, :class_name => 'Attendant', :stored_as => :array, :inverse_of => :speaking_proposals

  field :title
  field :abstract

  validates_presence_of :title
  validates_presence_of :abstract
end

