class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 helper_method :logged_in?
 def logged_in?
  !!current_user
end

def require_user
  if !logged_in?
    redirect_to login_path
  end
end
end
