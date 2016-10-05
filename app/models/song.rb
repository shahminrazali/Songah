class Song < ApplicationRecord

  def self.search(date)
    where(date: date)
  end
end
