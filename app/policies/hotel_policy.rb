class HotelPolicy < ApplicationPolicy
  def index?
    true
  end

  def manage?
    user && user.admin?
  end
end
