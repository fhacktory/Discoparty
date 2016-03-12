module Api
  module V1
    class SearchesController < ::ApplicationController
      def show
        if params[:q].present?
          tracks = DeezerApi.search(params[:q]) + SoundcloudApi.search(params[:q]) + YoutubeApi.search(params[:q])
          render json: tracks, root: false
        end
      end
    end
  end
end
