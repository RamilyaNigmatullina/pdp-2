class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.to_model
  end

  def method_missing(method_name)
    return manage? if method_name.to_s.end_with?("?") && respond_to?(:manage?)
    super
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s != "manage?" || super
  end
end
