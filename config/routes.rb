Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :links, except: [:delete]

  root "links#index"
  get "/logout", to: "sessions#destroy"
end
