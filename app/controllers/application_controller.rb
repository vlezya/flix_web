class ApplicationController < ActionController::Base
  
  private
  
  def require_login
    unless current_user
      puts "------------->> request.url - #{request.url}"
      session[:intended_url] = request.url
      redirect_to signin_path, alert: 'You must be logged in!'
    end
  end
  
  def current_user?(user)
    current_user == user
  end
  
  helper_method :current_user?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
end
