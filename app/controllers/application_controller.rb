class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_playlist


  def current_playlist
    return unless
    @current_playlist = Playlist.where(user_id: current_user.id).last

  end

  def get_current
    if cookies[:current]
      @current = cookies[:current]
    else
      @current = Playlist.where(user_id: current_user.id).last
    end
  end

  private


  def current_user
    return unless session[:id]
     @current_user ||= User.find_by(id: session[:id])
    end
    helper_method :current_user 
  end

  include CurrentUserHelper

    def authenticate!
    unless current_user
      redirect_to root_path
    end
  end
