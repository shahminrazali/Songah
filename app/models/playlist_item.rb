class PlaylistItem < ApplicationRecord
  has_many :songs
  has_many :playlists

  accepts_nested_attributes_for :songs
end
