class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      playlist = Playlist.create(playlist_name: "My First Playlist", user_id: @user.id)
      redirect_to new_session_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:username,:password,:email)
  end

end
