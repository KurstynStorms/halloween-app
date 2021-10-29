require "rails_helper"

RSpec.describe MoviesController, type: :controller do
  describe "GET #show" do
    it "renders the show template", :aggregate_failures do
      movie = create_movie

      get :show, params: { id: movie.id }

      expect(response).to render_template(:show)
    end

    # it "assigns @movie to the correct instance" do
    #   movie = create_movie

    #   get :show, params: { id: movie.id }

    #   expect(assigns[:movie]).to movie
    # end

    it "the response status is a success" do
      movie = create_movie

      get :show, params: { id: movie.id }, session: { user_id: 1 }

      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    describe "with valid attributes" do
      it "successfully create a new movie with all params passed" do
        expect { post :create, params: valid_movie_params }.to change(Movie, :count).by(1)

        new_movie = Movie.find_by(summary: "Scary zombie movie.")

        expect(new_movie).to be_present
      end

      it "redirects to a different page that gets updated with the recently created info" do
        post :create, params: valid_movie_params

        new_movie = Movie.find_by(summary: "Scary zombie movie.")

        expect(response).to redirect_to movies_path
      end
      # flash[:success], :notice, etc"
    end

    describe "with invalid attributes" do
      it "fails" do
        expect { post :create, params: invalid_movie_params }.to change(Movie, :count).by(0)

        expect(response).to render_template(:new)
      end
    end
  end

  def create_movie
    movie = Movie.create!(
      title: "28 Days Later",
      summary: "Scary zombie movie.",
      genre: "Horror",
      poster_url: "https://flxt.tmsimg.com/assets/p31044_p_v10_af.jpg"
    )
  end

  def valid_movie_params
    {
      movie: {
        title: "28 Days Later",
        summary: "Scary zombie movie.",
        genre: "Horror",
        poster_url: "https://flxt.tmsimg.com/assets/p31044_p_v10_af.jpg"
      }
    }
  end

  def invalid_movie_params
    {
      movie: {
        summary: "Scary zombie movie.",
        genre: "Horror",
        poster_url: "https://flxt.tmsimg.com/assets/p31044_p_v10_af.jpg"
      }
    }
  end
end