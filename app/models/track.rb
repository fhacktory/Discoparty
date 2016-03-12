class Track < ActiveRecord::Base
  belongs_to :playlist
  has_many :loves, -> { where vote_type: 'love' }, class_name: 'Vote'
  has_many :hates, -> { where vote_type: 'hate' }, class_name: 'Vote'

  validates :title, presence: true
  validates :artist, presence: true
  validates :provider, presence: true
  validates :provider_track_id, presence: true
  validates :playlist, presence: true

  def self.not_played
    where(played: false)
  end

  def score
    loves.count - hates.count
  end

  def loved?(user)
    loves.where(user: user).present?
  end

  def hated?(user)
    hates.where(user: user).present?
  end
end
