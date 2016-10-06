class Song < ApplicationRecord
  belongs_to :playlist_item

  def self.search(date)
    where(date: date)
  end
  
end
