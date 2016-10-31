Rails.application.routes.draw do
  root "links#index"

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :new, :create, :show]
end
