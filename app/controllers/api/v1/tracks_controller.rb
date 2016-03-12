module Api
  module V1
    class TracksController < ::ApplicationController
      def create
        playlist = Playlist.find(params[:playlist_id])
        track = Track.new(track_params.merge(playlist: playlist))

        if track.save
          render json: track, status: :created
        else
          render status: :bad_request
        end
      end

      private

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
  end
end