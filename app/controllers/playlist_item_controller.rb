class PlaylistItemController < ApplicationController
  before_action :authenticate!, only: [:create, :destroy]

  def create
    @current = get_current
    @playlist_item = PlaylistItem.create(playlist_items_params.merge(playlist_id: @current.id))
  end

  def destroy
    @playlist_item = PlaylistItem.find_by(playlist_item_params)
    @playlist_item.destroy
  end


private

  def playlist_items_params
    params.require(:playlist_item).permit(:song_id, :playlist_id)
  end

end
