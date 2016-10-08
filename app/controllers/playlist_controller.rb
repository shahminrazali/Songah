class PlaylistController < ApplicationController
  before_action :authenticate!, only: [:index, :create, :switch, :update, :new, :destroy]

  def index
    # binding.pry
    if (params[:playlist_id] == nil)

      @playlist = Playlist.new
      @user_playlist = Playlist.where(user_id: current_user.id)
      @playlist_items = PlaylistItem.where(playlist_id: @user_playlist.first.id)

      # @songs = Song.where(id: @playlist_items.each {|t| t.song_id})

      @songs = []
            @playlist_items.each do |a|
              @songs << Song.find(a.song_id)
            end

    else

      @user_playlist = Playlist.where(user_id: current_user.id)
      @playlist_items = PlaylistItem.where(playlist_id: params[:playlist_id])
      # @songs = Song.where(id: @playlist_items.each {|t| t.song_id})
      @songs = []
      @playlist_items.each do |a|
        @songs << Song.find(a.song_id)
      end
    end
  end

  def select_playlist

    # @playlist_items = PlaylistItem.where(playlist_id: params[:playlist_id])
    # @songs = Song.where(id: @playlist_items.each {|p| p.id})
    # redirect_to playlist_index_path(playlist_items: @playlist_items, songs: @songs)

  end

  def new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.save
    redirect_to root_path
  end

  def switch
    @current = Playlist.find_by(id: params[:id])
    cookies[:current] = @current.id
    redirect_to root_path
  end

  def destroy
    @playlist = Playlist.find_by(id: params[:id])
    @playlist.destroy
  end

  private

    def playlist_params
      params.require(:playlist).permit(:user_id, :playlist_name)
    end


    def set_current
      cookies[:current] = @current.id
    end



end
