class PlaylistItemPolicy < ApplicationPolicy

  def create?
    user.present? && user.admin?
  end

  def destroy
    create?
  end

end
