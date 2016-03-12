module Api
  module V1
    class HatesController < ::ApplicationController
      def create
        track = Track.find(params[:track_id])
        if Vote.create(love_params.merge(track: track))
          render status: :created
        else
          render status: :bad_request
        end
      end

      def destroy
        vote = Vote.find(params[:id])
        if vote.destroy
          render status: :ok
        else
          render status: :bad_request
        end
      end

      private

      def love_params
        {
          vote_type: 'hate',
          user: current_user
        }
      end
    end
  end
end
