require 'couchrest'

class SpeakingProposal < CouchRest::ExtendedDocument

  use_database CouchRest.database!('http://localhost:5984/agilasverige')

  property :title
  property :abstract

  begin

    database.save_doc({
      "_id" => "_design/speaking_proposal",
      :views => {
        :all => {
          :map => "function(doc) {
                       emit(doc.speaking_proposal.title,
                           doc.speaking_proposal.abstract,
                           doc.first_name,
                           doc.last_name)
                  }"
    }
    }
    })
  rescue 
    #TODO log
  end

  def self.all
    database.view('speaking_proposal/all')['rows']
  end

end

