Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "hotels#index"

  resources :hotels, only: %i[index new create edit update destroy]
end
