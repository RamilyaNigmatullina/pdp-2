shared_context :user_signed_in_as_admin do
  let(:current_user) { create :user, :admin }

  background do
    login_as current_user
  end
end
