class SpeakingProposal  < ActiveRecord::Base  

  has_many :speakers, :through => :registration, :source => :user
  belongs_to :registration

  mount_uploader :presentation, PresentationUploader

  validates_presence_of :title
  validates_presence_of :abstract
  validates_acceptance_of :accept_terms
  validate :has_speakers

  scope :created_today, where('speaking_proposals.created_at > ? AND speaking_proposals.created_at < ?', Date.today, Date.tomorrow)
  scope :last_five, limit(5).order('speaking_proposals.created_at DESC')
  scope :list, order('speaking_proposals.created_at DESC')
  scope :day1, where('booked_day1 = true')
  scope :day2, where('booked_day2 = true')

  def self.created_by_date 
    orig_data = count(:group => "DATE(speaking_proposals.created_at)")
    date_range = (orig_data.keys.min..orig_data.keys.max)
    
    data = {}
    date_range.each do |date|
      data[date] = orig_data[date] || 0
    end
    data
  end

  private

  def has_speakers
    speakers.size > 0
  end

end

