class PlaylistController < ApplicationController

  def index
    @playlist = Playlist.new
  end

  def new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    binding.pry
    @playlist.save
    redirect_to root_path
  end

  private

    def playlist_params
      params.require(:playlist).permit(:user_id, :playlist_name)
    end



end
