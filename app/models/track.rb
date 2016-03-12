class Track < ActiveRecord::Base
  belongs_to :playlist
  has_many :votes

  validates :title, presence: true
  validates :artist, presence: true
  validates :provider, presence: true
  validates :provider_track_id, presence: true
  validates :playlist, presence: true
end
