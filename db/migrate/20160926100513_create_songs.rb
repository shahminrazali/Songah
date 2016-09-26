class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.integer :year
      t.string :title
      t.string :artist
      t.string :link

      t.timestamps
    end
  end
end
