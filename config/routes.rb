Rails.application.routes.draw do
  devise_for :users
  root to: 'slots#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :slots do
    resources :reservations, only: [:new, :create, :update]
  end
  resources :reservations
end
