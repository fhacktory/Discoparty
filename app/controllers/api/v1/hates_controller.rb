module Api
  module V1
    class HatesController < ::ApplicationController
      before_action :set_track

      def create
        if Vote.create(hate_params.merge(track: @track))
          head :created
        else
          head :bad_request
        end
      end

      def destroy
        hate = @track.hate_for(current_user)
        if hate.destroy
          head :ok
        else
          head :bad_request
        end
      end

      private

      def set_track
        @track = Track.find(params[:track_id])
      end

      def hate_params
        {
          vote_type: 'hate',
          user: current_user
        }
      end
    end
  end
end
