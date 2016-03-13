class Playlist < ActiveRecord::Base
  has_many :tracks

  validates :name, presence: true

  def current_track
    tracks.where(playing: true, played: false)
  end

  def next_tracks_ordered
    tracks.where(playing: false, played: false).sort_by { |track| -track.score }
  end
end
