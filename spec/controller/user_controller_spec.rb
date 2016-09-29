require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  describe "should show error when no method present" do

    it "should show index" do
      get :index
      expect(subject).to render_template(:index)
    end

    it "should show new" do
      get :new
      expect(subject).to render_template(:new)
    end

    it "should show edit" do
      params= {id: @user.id}
      get :edit, params: params
      expect(subject).to render_template(:edit)
    end

    it "should create" do
      params={user: {name: "elliot", password:"password"}}
      post :create, params: params
      expect(User.count).to eql(2)
    end

    it "should update" do
      params={id: @user.id, user:{name:"tun"}}
      patch :update, params: params

      @user.reload

      expect(@user.name).to eql("tun")
      expect(User.count).to eql(1)
    end

    it "should delete" do
      params={id: @user.id}
      delete :destroy, params: params

      expect(User.count).to eql(0)
    end

  end
end
