module V1
  class DashboardController < ApplicationController
    def index
    end

    # client ui for movie and ratings
    #
    # @return [Type] description_of_returned_object
    def movie
      @movie_id = params[:id]
    end
  end
end
