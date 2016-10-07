class PlaylistItemController < ApplicationController

  def create
    @current = get_current
    @playlist_item = PlaylistItem.create(playlist_items_params.merge(playlist_id: @current.to_i))
  end


private

  def playlist_items_params
    params.require(:playlist_item).permit(:song_id, :playlist_id)
  end

end
