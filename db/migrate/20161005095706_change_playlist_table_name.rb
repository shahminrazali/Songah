class ChangePlaylistTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :create_playlist_tables, :playlists
  end
end
