class PlaylistController < ApplicationController

  def index
    @playlist = Playlist.new
    @playlists = Playlist.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.save
    redirect_to root_path
  end

  def switch
    # @current_playlist = params[:id]
    @current = Playlist.find_by(id: params[:id])
    cookies[:current] = @current.id
    binding.pry
    redirect_to root_path
  end

  private

    def playlist_params
      params.require(:playlist).permit(:user_id, :playlist_name)
    end


    def set_current
      cookies[:current] = @current.id
    end



end
