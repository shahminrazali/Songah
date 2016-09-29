require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  describe "should show error when no method present" do
    it "should show new"do
      get :new
      expect(subject).to render_template(:new)
    end

    it "should create new session"do
      params={id: @user.id, user:{ email: @user.email, password:@user.password} }
      post :create, params: params
      expect(session[:id]).to eql(@user.id)
    end

    it "should delete session"do
      params={id: @user.id, user:{ email: @user.email, password:@user.password} }
      post :create, params: params

      params1={id: session.id}
      delete :destroy, params: params1

      expect(session[:id]).to be_nil
    end

  end

end
