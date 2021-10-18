class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :date
      t.boolean :favorite
      t.string :content
      t.integer :scare_rating

      t.timestamps
    end
  end
end
