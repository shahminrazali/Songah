class PlaylistItemController < ApplicationController

  def create
    @playlist_item = PlaylistItem.create(playlist_items_params)
    binding.pry
  end


private

  def playlist_items_params
    params.require(:playlist_item).permit(:song_id, :playlist_id)
  end

end
