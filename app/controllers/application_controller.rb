class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  def current_user_1
    @current_user ||= User.find(session[:user_id]) if session[:user]
  end
end
