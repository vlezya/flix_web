class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :require_login, except: %i[index show]
  before_action :require_admin, except: %i[index show]

  def index
    @movies = Movie.send(movies_filter)
  end

  def show
    @fans = @movie.fans
    @genres = @movie.genres.order(:name)

    return unless current_user

    @favorite = current_user.favorites.find_by(movie_id: @movie.id)
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to(@movie, notice: 'Movie was successfully updated')
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to(@movie, notice: 'Movie was successfully created')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def new
    @movie = Movie.new
  end

  def destroy
    @movie.destroy
    redirect_to(movies_path, status: :see_other,
                             alert: 'Movie has been successfully destroyed'
    )
  end

  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :total_gross, :released_on,
                                  :director, :duration, :main_image, genre_ids: []
    )
  end

  def movies_filter
    if params[:filter].in?(%w[upcoming recent hits flops])
      params[:filter]
    else
      :release
    end
  end
end
