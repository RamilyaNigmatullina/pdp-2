class HotelPolicy < ApplicationPolicy
  alias_rule :new?, :create?, to: :manage?

  def index?
    true
  end

  def manage?
    user&.admin?
  end
end
