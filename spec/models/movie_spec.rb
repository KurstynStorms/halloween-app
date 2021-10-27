require "rails_helper"

RSpec.describe Movie, type: :model do
  #tests go here
  context 'movie validations' do
    it "movie is valid when all attributes are present" do
      expect(Movie.create(title: "YAY", summary: "dfsdfsf", genre: "sfgser", poster_url: "dfsdvd"))
    end

    it "movie is invalid if title is missing" do
      expect(Movie.create(summary: "dfsdfsf", genre: "sfgser", poster_url: "dfsdvd"))
    end
  end
end