class Authenticate::PrepareParams
  include Interactor

  delegate :auth_data, to: :context

  def call
    binding.pry
    context.decorated_auth_data = AuthDataDecorator.new(auth_data)
  end
end
