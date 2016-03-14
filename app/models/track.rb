class Track < ActiveRecord::Base
  belongs_to :playlist
  has_many :loves, -> { where vote_type: 'love' }, class_name: 'Vote'
  has_many :hates, -> { where vote_type: 'hate' }, class_name: 'Vote'

  validates :title, presence: true
  validates :provider, presence: true
  validates :provider_track_id, presence: true
  validates :playlist, presence: true

  def score
    loves.count - hates.count
  end

  def love_for(user)
    loves.where(user: user)
  end

  def hate_for(user)
    hates.where(user: user)
  end
end
