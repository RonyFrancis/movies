class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :description
      t.timestamps
    end
  end
end
