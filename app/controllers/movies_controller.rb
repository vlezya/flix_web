class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  
  def index
    @movies = Movie.release
  end
  
  def show; end
  
  def edit; end
  
  def update
    @movie.update(movie_params)
    redirect_to @movie
  end
  
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end
  
  def new
    @movie = Movie.new
  end
  
  def destroy
    @movie.destroy
    redirect_to movies_path, status: :see_other
  end
  
  private
  
  def set_movie
    @movie = Movie.find(params[:id])
  end
  
  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :total_gross, :released_on)
  end
end
