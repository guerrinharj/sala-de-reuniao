Rails.application.routes.draw do
  devise_for :users
  root to: 'slots#index'
  get '/lastweek', to: "slots#lastweek", as: :lastweek
  get '/nextweek', to: "slots#nextweek", as: :nextweek
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :slots do
    resources :reservations
  end
  resources :users, only: [:show]
end
