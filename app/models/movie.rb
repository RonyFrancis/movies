# Movie model
class Movie < ApplicationRecord
  has_many :ratings

  # get the average rating of the movie
  #
  # @return integer average_rating_of_the_movie
  def avg_rating
    total_rating = 0
    ratings.each do |rating|
      total_rating += rating.rate
    end
    total_rating / ratings.count
  end
end
