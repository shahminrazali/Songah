class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_playlist

  def current_user
    return unless session[:id]
     @current_user ||= User.find_by(id: session[:id])
    end
    helper_method :current_user 
  end

  def current_playlist

      @current_playlist = Playlist.find(1)

  end

  include CurrentUserHelper

  private
    def authenticate!
    unless current_user
      redirect_to root_path

  end
end
