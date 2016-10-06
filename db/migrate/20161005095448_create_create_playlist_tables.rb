class CreateCreatePlaylistTables < ActiveRecord::Migration[5.0]
  def change
    create_table :create_playlist_tables do |t|
      t.string :playlist_name
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end
end
