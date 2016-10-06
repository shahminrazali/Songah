class CreatePlaylistItems < ActiveRecord::Migration[5.0]
  def change
    create_table :playlist_items do |t|
      t.integer :song_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
