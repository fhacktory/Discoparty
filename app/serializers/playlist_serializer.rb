class PlaylistSerializer < ActiveModel::Serializer
  attributes :name, :played_at, :created_at, :updated_at, :tracks

  def tracks
    object.tracks.not_played.map do |track|
      {
        id: track.id
        title: track.title,
        provider: track.provider,
        provider_track_id: track.provider_track_id,
        duration: track.duration,
        artist: track.artist,
        image_url: track.image_url,
        score: track.score,
        loved: track.love_for(scope).present?,
        hated: track.hate_for(scope).present?
      }
    end.sort_by { |track| track[:score] }
  end
end
