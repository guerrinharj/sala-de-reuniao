Rails.application.routes.draw do
  devise_for :users
  root to: 'reservations#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :reservations, only: [:create, :update]
  end
  resources :reservations
end
