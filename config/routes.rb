Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :links, only: [:index, :new, :create, :show]

  root "links#index"
  get "/logout", to: "sessions#destroy"
end
