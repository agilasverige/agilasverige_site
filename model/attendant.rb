require 'couchrest'

class Attendant < CouchRest::ExtendedDocument

  include CouchRest::Validation

  START_INVOICE_NO = 100

  use_database CouchRest.database!('http://localhost:5984/agilasverige')
  timestamps!
  
  property :first_name
  property :last_name
  property :email
  property :organization
  property :address
  property :zip_code
  property :postal_address
  property :country
  property :telephone_number
  property :attending_dinner
  property :food_preferences
  property :comments
  property :invoice_date
  property :invoice_no
  property :speaker
  property :speaking_proposal, :cast_as => 'SpeakingProposal'

  view_by :last_name
  view_by :email
  view_by :id


  begin
    database.save_doc({
      "_id" => "_design/invoice_no", 
      :views => {
        :highest => {
          :map => "function(doc) {
                    emit('invoice_no', doc['invoice_no']);
                  }",
          :reduce => "function(key, invoice_no) {
                        var highest = 0;
                        for(var i=0; i < invoice_no.length; i++) {
                          if(invoice_no[i]>highest) {
                            highest = invoice_no[i];
                          }
                        }
                        return highest;
                      }"
        }
      }
    })

    database.save_doc({
      "_id" => "_design/speaking_proposals", 
      :views => {
        :all => {
          :map => "
              function(doc) {
                if(doc.speaking_proposal.title != ''){
                  emit(doc.speaking_proposal.title,
                       { 
                         'title': doc.speaking_proposal.title,
                         'abstract': doc.speaking_proposal.abstract,
                         'first_name': doc.first_name,
                         'last_name': doc.last_name
                       });
                }
              }"
        }
      }
    })

          
  rescue 
   #TODO log 
  end
  
  save_callback :before, :set_save_data

  def speaker?
    speaker
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.speakers_by_lastname
    all = Attendant.by_last_name
    all.delete_if{|attendant| !attendant.speaker}
  end

  def self.speakers_by_lastname
    all = Attendant.by_last_name
    all.delete_if{|attendant| !attendant.speaker}
  end

  def self.dinner_guests_by_lastname
    all = Attendant.by_last_name
    all.delete_if{|attendant| !attendant.attending_dinner}
  end

  def self.speaking_proposals
    result = database.view('speaking_proposals/all')['rows']
    
    puts result.inspect
    set = []
    result.each do |proposal|
      values = proposal['value']
      attendant = Attendant.new(values) 
      speaking_proposal = SpeakingProposal.new(values)
      attendant.speaking_proposal = speaking_proposal
      set.push(attendant)
    end
    set
  end

  validates_format :email, :as => :email_address
  validates_present :first_name, :last_name, :address
  validates_present :zip_code, :postal_address

  protected

  def set_save_data
    set_invoice_no
    set_date
  end

  def set_date
    date = Date.today.to_s
  end

  def set_invoice_no
    if new_document?
      begin
        current_invoice_no = database.view('invoice_no/highest')['rows'].first["value"] 
      rescue
        if current_invoice_no.nil? ||  current_invoice_no == 0
          current_invoice_no = START_INVOICE_NO
        end
      end
      invoice_no = current_invoice_no + 1
    end
  end

  def new_document?
    invoice_no.nil? || invoice_no == 0
  end

  # def speaker?
  #   speaking_proposals.each do |proposal|
  #     return true if proposal.accepted?
  #   end
  # end

  # def full_name
  #   "#{first_name} #{last_name}"
  # end
  # def save
  #   saved_with_same_email = Attendant.by_email(:key => self.email).first
  #   unless(saved_with_same_email.nil? || saved_with_same_email.id == id)
  #     raise ArgumentError.new("A user with email #{email} already exists")
  #   end
  #   super
  # end
  
end
