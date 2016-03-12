class TracksController < ApplicationController
  before_action :set_playlist, only: :create

  def create
    Track.new(track_params.merge(playlist: @playlist))
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def track_params
    params
      .require(:track)
      .permit(
        :title,
        :provider,
        :provider_track_id,
        :duration,
        :image_url,
        :artist
      )
  end
end
