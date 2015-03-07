class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_login

  def index
    redirect_to '/music_player/login'
  end
  
  def current_user
  	User.where(id: session[:user_id]).first
  end

  private

  def require_login
  	redirect_to '/music_player/login' if session[:user_id].nil?
  end
end
