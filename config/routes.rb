Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "hotels#index"

  resources :hotels, only: %i[index new create edit update destroy]
  resource :geolocations, only: :show
end
