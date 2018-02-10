# Rating Model
class Rating < ApplicationRecord
  belongs_to :movie
  has_many :votes
end
