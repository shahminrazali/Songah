class PlaylistController < ApplicationController

  def index
  end

  def song_search
    date = song_params[:date]
    @song = []
    @song = Song.search(date)

    if @song == []

     date_find(date)
    end
  end

  def view
  end

  def date_find(date)
    m = Date.parse(date).mon
    y = Date.parse(date).year

    case m
     when 1
       m = y
       date = y.to_s + ("-01-14")
       @song = Song.search(date)
     when 2
       m = y
       date = y.to_s + ("-01-14")
       @song = Song.search(date)
     when 3
       m = y
       date = y.to_s + ("-01-14")
       @song = Song.search(date)
     when 4
       m = y
       date = y.to_s + ("-05-14")
       @song = Song.search(date)
     when 5
       m = y
       date = y.to_s + ("-05-14")
       @song = Song.search(date)
     when 6
       m = y
       date = y.to_s + ("-05-14")
       @song = Song.search(date)
     when 7
       m = y
       date = y.to_s + ("-05-14")
       @song = Song.search(date)
     when 8
       m = y
       date = y.to_s + ("-09-14")
       @song = Song.search(date)
     when 9
       m = y
       date = y.to_s + ("-09-14")
       @song = Song.search(date)
     when 10
       m = y
       date = y.to_s + ("-09-14")
       @song = Song.search(date)
     when 11
       m = y
       date = y.to_s + ("-09-14")
       @song = Song.search(date)
     when 12
       m = y
       date = y.to_s + ("-09-14")
       @song = Song.search(date)
     end
  end


  private

  def song_params
    params.require(:song_search).permit(:date)
  end

end
