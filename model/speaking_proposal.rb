require 'couchrest'

class SpeakingProposal < CouchRest::ExtendedDocument

  use_database CouchRest.database!('http://localhost:5984/agilasverige')

  property :title
  property :abstract

end

