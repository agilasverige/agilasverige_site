class SpeakingProposal  < ActiveRecord::Base  

  has_many :speaking_engagements
  has_many :speakers, :through => :speaking_engagements, :source => :user

  validates_presence_of :title
  validates_presence_of :abstract
  validates_acceptance_of :accept_terms

  scope :created_today, where('created_at > ? AND created_at < ?', Date.today, Date.tomorrow)
  scope :last_five, limit(5).order('created_at DESC')

  def self.created_by_date 
    count(:group => "DATE(created_at)")
  end

end

