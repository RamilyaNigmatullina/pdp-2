class HotelPolicy < ApplicationPolicy
  alias_rule :new?, to: :manage?

  def index?
    true
  end

  def manage?
    user&.admin?
  end
end
