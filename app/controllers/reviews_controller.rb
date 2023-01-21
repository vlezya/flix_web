class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_review
  
  def index
    @reviews = @movie.reviews
  end
  
  def new
    @review = @movie.reviews.new
  end
  
  def create
    @review = @movie.reviews.new(params_review)
    @review.user = current_user
    
    if @review.save
      redirect_to movie_reviews_path, notice: 'Thanks for you review'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def set_review
    @movie = Movie.find(params[:movie_id])
  end
  
  def params_review
    params.require(:review).permit(:comment, :stars)
  end
end
