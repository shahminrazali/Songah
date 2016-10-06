module CurrentUserHelper
  def current_user
    return unless session[:id]
    @current_user ||= User.find_by(id: session[:id])
  end
end
