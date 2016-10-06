require 'rails_helper'

RSpec.describe PlaylistItemController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  describe "should be able to create playlist" do
    it "should add song to playlist" do
      params = {playlist_item: {playlist_id: 1, song_id: 1}}

      post :create, params: params

      expect(PlaylistItem.count).to eql(1)
    end
  end
end
