class RemoveSongIdFromPlaylist < ActiveRecord::Migration[5.0]
  def change
    remove_column :playlists, :song_id
  end
end
