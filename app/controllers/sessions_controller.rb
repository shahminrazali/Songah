class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: user_params[:email])
          &.authenticate(user_params[:password])
    binding.pry
    if user
      session[:id] = user.id
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
    session.delete(:id)
    flash[:success] = "You've been logged out"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
