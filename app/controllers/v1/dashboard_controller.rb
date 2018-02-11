module V1
  # dashboard apis
  class DashboardController < ApplicationController
    before_action :current_user, :authorize
    # list all movies
    def index; end

    # client ui for movie and ratings
    #
    # @return [id] movie id
    def movie
      @movie_id = params[:id]
    end
  end
end
