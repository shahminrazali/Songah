class AutoController < ApplicationController

  def index

  end

  def search
    date = DateTime.parse(params[:song_search][:date])
    date_range = [date+6.years, date+12.years, date + 13.years, date + 17.years, date + 18.years, DateTime.now]

    childhood_pl =  Playlist.create(playlist_name: "Childhood", user_id: current_user.id)
    teenage_pl = Playlist.create(playlist_name: "Teenage", user_id: current_user.id)
    adulthood_pl = Playlist.create(playlist_name: "Adulthood", user_id: current_user.id)

    @childhood = Song.where("date >= :start_date AND date <= :end_date",{start_date: date_range[0], end_date: date_range[1]}).limit(100)
    @teenage = Song.where("date >= :start_date AND date <= :end_date",{start_date: date_range[2], end_date: date_range[3]}).limit(100)
    @adulthood = Song.where("date >= :start_date AND date <= :end_date",{start_date: date_range[4], end_date: date_range[5]}).limit(100)

    @childhood.each do |c|
      a = PlaylistItem.create(playlist_id: childhood_pl.id, song_id: c.id)
    end
    @teenage.each do |c|
      b = PlaylistItem.create(playlist_id: teenage_pl.id, song_id: c.id)
    end
    @adulthood.each do |c|
      c = PlaylistItem.create(playlist_id: adulthood_pl.id, song_id: c.id)
    end
    binding.pry
  end

end
