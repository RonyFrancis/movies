# Vote table
class CreateVotes < ActiveRecord::Migration[5.1]
  # create vote table
  def change
    create_table :votes do |t|
      t.string :vote
      t.integer :rating_id
      t.timestamps
    end
  end
end
