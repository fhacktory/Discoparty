class PlaylistSerializer < ActiveModel::Serializer
  attributes :name, :played_at, :created_at, :updated_at, :tracks

  def tracks
    (object.current_track + object.next_tracks_ordered).map do |track|
      {
        id: track.id,
        title: track.title,
        provider: track.provider,
        provider_track_id: track.provider_track_id,
        duration: track.duration,
        artist: track.artist,
        image_url: image_for(track),
        score: track.score,
        playing: track.playing,
        loved: track.love_for(scope).present?,
        hated: track.hate_for(scope).present?,
        love_url: api_v1_playlist_track_loves_path(object, track),
        hate_url: api_v1_playlist_track_hates_path(object, track)
      }
    end
  end

  private

  def image_for(track)
    if track.image_url.present?
      track.image_url
    else
      ActionController::Base.helpers.asset_path('default-song-icon-2x.jpg')
    end
  end
end
