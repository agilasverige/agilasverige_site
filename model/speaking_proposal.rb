class SpeakingProposal 

  include MongoMapper::Document

  key :title, :required => true
  key :abstract, :required => true
  key :snake_title

  before_save :set_snake_title

  def set_snake_title
    title.gsub(/\s/, "_")
  end

end

