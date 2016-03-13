module Api
  module V1
    class LovesController < ::ApplicationController
      before_action :set_track

      def create
        if Vote.create(love_params.merge(track: @track))
          head :created
        else
          head :bad_request
        end
      end

      def destroy
        love = @track.love_for(current_user)
        if love.destroy
          head :ok
        else
          head :bad_request
        end
      end

      private

      def set_track
        @track = Track.find(params[:track_id])
      end

      def love_params
        {
          vote_type: 'love',
          user: current_user
        }
      end
    end
  end
end
