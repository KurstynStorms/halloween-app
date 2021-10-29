class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :scare_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, length: { maximum: 250 }
end
