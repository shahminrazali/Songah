class Playlist < ApplicationRecord
  belongs_to :user, optional: true
end
