Rails.application.routes.draw do
  root "links#index"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :links, only: [:index, :new, :create, :show]

  get "/logout", to: "sessions#destroy"
end
