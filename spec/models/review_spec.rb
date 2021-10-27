require "rails_helper"

RSpec.describe Movie, type: :model do
  #tests go here
  context 'review validations' do
    it "review is valid when all attributes are present" do
      expect(Review.create(movie_id: 1, content: "content", scare_rating: 2, user_id: 1))
    end
  end
end