class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update]
  
  def index
    @movies = Movie.all
  end
  
  def show; end
  
  def edit; end
  
  def update
    @movie.update(movie_params)
    redirect_to @movie
  end
  
  private
  
  def set_movie
    @movie = Movie.find(params[:id])
  end
  
  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :total_gross, :released_on)
  end
end
