class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to reviews_path(@reviews)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      flash[:alert] = format_errors(@review)
      render :edit
    end
  end

private
  def review_params
    params.require(:review).permit(
      :date, 
      :favorite, 
      :content, 
      :scare_rating, 
      :movie_id,
      :user_id
    )
  end  
end