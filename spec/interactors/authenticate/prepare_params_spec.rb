require "rails_helper"

describe Authenticate::PrepareParams do
  subject { described_class.call(auth_data: auth_data).decorated_auth_data }

  let(:auth_data) do
    build :omniauth, :facebook, uid: "1234567", email: "user@example.com", name: "John Smith"
  end

  describe ".call" do
    it "decorates auth_data" do
      is_expected.to eq(AuthDataDecorator.new(auth_data))
    end
  end
end
