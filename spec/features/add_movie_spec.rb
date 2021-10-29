require 'rails_helper'

describe "when a user visits the index page" do
  it "they can add a new movie using the add movie button" do
    visit movies_path

    click_on "Add New Movie"

    fill_in "Movie Title", with: "28 Days Later"
    fill_in "Genre", with: "Horror"
    fill_in "Summary", with: "Unsettling zombie film set in England. Cillian Murphy tried to find refuge."
    fill_in "Paste a Movie Poster Url Link here", with: "https://flxt.tmsimg.com/assets/p31044_p_v10_af.jpg"

    click_on "Create Movie"

    expect(Movie.last.title).to eq "28 Days Later"
    expect(page).to have_content "28 Days Later"
  end
end