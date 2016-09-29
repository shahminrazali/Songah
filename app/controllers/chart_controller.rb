class ChartController < ApplicationController

  def index

    page = HTTParty.get('http://www.officialcharts.com/charts/singles-chart/19521114/7501/')
    # artist_array = []
    @date = Date.new(2001,9,14) #1previously obtained from 19901114 - 20010614
    enddate = Date.today #20160927


    # spotify_array = []
    while @date != enddate do
    title_array = []
    i=1 # i is set to 1
    parse_page = Nokogiri::HTML(page)


      parse_page.css('.track').map do |a|
        image = a.xpath('div/img/@src').text
        title = a.css('.title-artist').css('.title').xpath('a').text
        artist = a.css('.title-artist').css('.artist').xpath('a').text
        spotify = parse_page.css(".actions-view-listen-#{i}").css('.spotify').xpath('@href').text
        deezer = parse_page.css(".actions-view-listen-#{i}").css('.deezer').xpath('@href').text
        date = @date


        song = Song.new(title: title, artist: artist, image_link: image, spotify: spotify, deezer: deezer, date: date)

        title_array.push(song)
        i+=1
      end

      @date = @date + 4.month

      page = HTTParty.get("http://www.officialcharts.com/charts/singles-chart/#{@date.to_s.remove('-')}/7501/")

      title_array.each do |a|
        a.save
      end

    end


    #
    # parse_page.css('.chart-row__artist').map do |a|
    #   @artist = a.text
    #   artist_array.push(@artist)
    # end
    #
    # parse_page.css('.chart-row__link').map do |a|
    #   @spotify = a.xpath("@data-href").text
    #   spotify_array.push(@spotify)
    # end

    # for i in 0..200
    #   Song.create(:title => title_array[i], :artist => artist_array[i], :link => spotify_array[i])
    # end

  end

end
