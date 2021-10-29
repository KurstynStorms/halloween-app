require "rails_helper"

RSpec.describe Movie, type: :model do
  #tests go here

  describe "schema" do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:summary).of_type(:string) }
    it { is_expected.to have_db_column(:genre).of_type(:string) }
    it { is_expected.to have_db_column(:poster_url).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'movie validations' do
    it "movie is valid when all attributes are present" do
      expect(Movie.create(title: "YAY", summary: "dfsdfsf", genre: "sfgser", poster_url: "dfsdvd"))
    end

    it "movie is invalid if title is missing" do
      expect(Movie.create(summary: "dfsdfsf", genre: "sfgser", poster_url: "dfsdvd"))
    end
  end
end

