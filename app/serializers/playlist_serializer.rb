class PlaylistSerializer < ActiveModel::Serializer
  attributes :name, :played_at, :created_at, :updated_at, :tracks

  def tracks
    foo = object.tracks.not_played.map do |track|
      {
        title: track.title,
        provider: track.provider,
        provider_track_id: track.provider_track_id,
        duration: track.duration,
        artist: track.artist,
        image_url: track.image_url,
        score: track.score
      }
    end.sort_by { |track| track[:score] }
  end
end
