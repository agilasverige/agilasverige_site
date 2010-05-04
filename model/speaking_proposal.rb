class SpeakingProposal 

  include MongoMapper::Document

  belongs_to :speaker, :class_name => "Attendant", :foreign_key => :attendant_id

  key :title, String, :required => true
  key :abstract, String, :required => true
  key :filename, String


  def snake_title
    title.gsub!(/\s/, "_")
    title.gsub(/[^\x20-\x7E]/,"")
  end


end

