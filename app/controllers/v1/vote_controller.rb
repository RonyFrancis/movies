module V1
  # voting function
  class VoteController < ApplicationController
    skip_before_action :verify_authenticity_token
    # user can up or down vote comment
    #
    # @return json vote_details
    def voting
      @voting = Vote.new(voting_params)
      # vote: params[:vote_type],
      #                  rating_id: params[:rating_id])

      @voting.save
      render json: { vote: { vote_type: @voting.vote } }
    end

    private

    def voting_params
      params.require(:vote).permit(:vote, :rating_id)
    end
  end
end
