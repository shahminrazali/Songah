class PlaylistController < ApplicationController

  def index
  end

  def create
    @playlist = Playlist.create(playlist_params)
  end

  private

    def playlist_params
      params.require(:playlist).permit(:user_id, :playlist_name)
    end



end
