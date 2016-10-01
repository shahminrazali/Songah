class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.date :date
      t.string :title
      t.string :artist
      t.string :spotify
      t.string :deezer
      t.string :image_link

      t.timestamps
    end
  end
end
