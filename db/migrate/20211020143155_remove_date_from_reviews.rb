class RemoveDateFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :date, :integer
  end
end
