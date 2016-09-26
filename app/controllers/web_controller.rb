class WebController < ApplicationController

  def index
    page = HTTParty.get('http://www.billboard.com/charts/year-end/2003/top-billboard-200-albums')
    artist_array = []
    title_array = []
    spotify_array = []

    parse_page = Nokogiri::HTML(page)

    parse_page.css('.chart-row__song').map do |a|
      @title = a.text
      title_array.push(@title)
    end

    parse_page.css('.chart-row__artist').map do |a|
      @artist = a.text
      artist_array.push(@artist)
    end

    parse_page.css('.chart-row__link').map do |a|
      @spotify = a.xpath("@data-href").text
      spotify_array.push(@spotify)
    end

    for i in 0..200
      Song.create(:title => title_array[i], :artist => artist_array[i], :link => spotify_array[i])
    end
    binding.pry
  end

end
