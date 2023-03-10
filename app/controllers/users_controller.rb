class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]
  before_action :require_correct_user, only: %i[edit update destroy]
  before_action :set_user, only: %i[show update edit destroy]

  def index
    @users = User.all
  end

  def show
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(@user, notice: 'Thanks for signing up!')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to(@user, notice: 'Account successfully updated')
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to(movies_path, status: :see_other, alert: 'Account successfully deleted')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_correct_user
    @user = User.find(params[:id])
    return if current_user?(@user)

    redirect_to(movies_path, status: :see_other)
  end
end
