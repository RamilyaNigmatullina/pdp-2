Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "hotels#index"

  resources :hotels
  resource :geolocations, only: :show
end
