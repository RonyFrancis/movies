class AvgRating < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :avg_rating, :integer, default: 0
  end
end
