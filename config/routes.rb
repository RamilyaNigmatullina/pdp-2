Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "hotels#index"

  resources :hotels, only: :index
  resource :geolocations, only: %i[create destroy]
end
