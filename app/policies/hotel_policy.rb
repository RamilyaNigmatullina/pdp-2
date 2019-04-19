class HotelPolicy < ApplicationPolicy
  alias_rule :new?, :create?, to: :manage?
  alias_rule :show?, to: :index?

  def index?
    true
  end

  def manage?
    user&.admin?
  end
end
