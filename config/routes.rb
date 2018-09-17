Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :products, only: [:index, :new, :create]

  resources :suppliers, only: [:index, :new, :create, :edit, :update, :destroy]
end
