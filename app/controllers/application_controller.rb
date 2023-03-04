class ApplicationController < ActionController::Base
  private

  def require_login
    return if current_user

    session[:intended_url] = request.url
    redirect_to(signin_path, alert: 'You must be logged in!')
  end

  def require_admin
    return if current_user_admin?

    redirect_to(root_path, alert: 'You must be logged in!')
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
