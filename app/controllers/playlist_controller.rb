class PlaylistController < ApplicationController

  def index
    @playlist = Playlist.new
    @user_playlist = Playlist.all
    @playlist_items = PlaylistItem.where(playlist_id: @user_playlist.first.id)
    @songs = Song.where(id: @playlist_items.each {|p| p.id})
  end

  def select_playlist
    @playlist_items = PlaylistItem.where(playlist_id: Playlist.find(params[playlist_id]))
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
