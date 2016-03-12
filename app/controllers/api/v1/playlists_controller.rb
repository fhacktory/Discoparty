module Api
  module V1
    class PlaylistsController < ::ApplicationController
      def show
        render json: Playlist.find(params[:id]), root: false
      end
    end
  end
end
