class SpeakingProposal 

  include MongoMapper::Document

  belongs_to :speaker, :class_name => "Attendant", :foreign_key => :attendant_id

  key :title, String, :required => true
  key :abstract, String, :required => true
  key :filename, String


  def base_file_name
    title.gsub(/\s/,'_').gsub(/[^a-zA-Z0-9_]/, "")
  end


end

