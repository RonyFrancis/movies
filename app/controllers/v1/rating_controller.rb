module V1
  # rating for movies
  class RatingController < ApplicationController
    skip_before_action :verify_authenticity_token
    # create a rating for the specified movie
    #
    # @return json created_rating
    def create
      @rating = Rating.new(rating_params)
      @rating.save
      @movie = Movie.find(params[:rating][:movie_id])
      @movie.update_attributes(avg_rating: @movie.avg_rating)
      render json: @rating
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
