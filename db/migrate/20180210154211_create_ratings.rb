# Rating Table
class CreateRatings < ActiveRecord::Migration[5.1]
  # create rating table
  def change
    create_table :ratings do |t|
      t.integer :rate, default: 0
      t.string :comment
      t.integer :movie_id
      t.timestamps
    end
  end
end
