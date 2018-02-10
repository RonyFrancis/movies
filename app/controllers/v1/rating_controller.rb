module V1
  # rating for movies
  class RatingController < ApplicationController
    skip_before_action :verify_authenticity_token
    # create a rating for the specified movie
    #
    # @return json created_rating
    def create
      puts params
      @rating = Rating.new(rating_params)
      @rating.save
      render json: { rating: @rating }
      # render json: { rating: { movie_id: 1,
      #                          rate: 3,
      #                          comment: 'good' } }
    end

    private

    # #rating_params strong parameters
    #
    # @return hash params_for_rating
    def rating_params
      params.require(:rating).permit(:movie_id, :rate, :comment)
    end
  end
end
