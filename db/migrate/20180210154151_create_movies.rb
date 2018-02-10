# Movie table
class CreateMovies < ActiveRecord::Migration[5.1]
  # Movie table
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
