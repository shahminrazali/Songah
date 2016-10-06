class PlaylistItem < ApplicationRecord
  has_many :songs
  has_many :playlists
end
