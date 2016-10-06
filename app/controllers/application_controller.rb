class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentUserHelper

  private

  def authenticate!
    unless current_user
      redirect_to root_path
    end
  end
end
