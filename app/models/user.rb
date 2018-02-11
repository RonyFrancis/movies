class User < ApplicationRecord
  has_many :genres
  has_many :movies, through: :genres
end
