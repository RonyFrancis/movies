module V1
  # Movies apis for listing and showing movie details
  class MoviesController < ApplicationController
    before_action :fetch_movie, except: [:index]
    # return the list of movies
    #
    # @return json list_of_movies
    def index
      @movies = Movie.all
      render json: { movies: @movies }
      # render json: { movies: [{ name: 'IronMan' },
      #                         { name: 'hulk' },
      #                         { name: 'ironman2' },
      #                         { name: 'thor' },
      #                         { name: 'captain america' },
      #                         { name: 'avengers' }] }
    end

    # show the selected movie
    #
    # @return json details_of_the_and_reviews_by_the_users
    def show
      render json: { movie: @movie, review: @movie.ratings }
      # render json: { movie: { name: 'IronMan' },
      #                review: [{ rating: 4 }, coment: 'superhero movie'] }
    end

    # fetches the average rating from the given movie
    #
    # @return json average_rating_of_the_movie
    def average_rating
      render json: { rating: { avg_rating: @movie.avg_rating } }
    end

    private

    def fetch_movie
      @movie = Movie.find(params[:id])
    end
  end
end
