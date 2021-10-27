class Movie < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  scope :halloween, -> { where(title: "Halloween") }
  
end
