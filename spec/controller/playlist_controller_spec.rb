require 'rails_helper'

RSpec.describe PlaylistController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  describe "should be able to create playlist" do
    it "should create playlist" do
      params = {playlist: {playlist_name: "ABCD", user_id: @user.id}}

      post :create, params: params

      expect(Playlist.count).to eql(1)
    end
  end


end
