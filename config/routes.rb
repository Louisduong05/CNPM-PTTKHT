Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :products, only: [:index, :new, :create, :edit, :update]

  resources :suppliers, only: [:index, :new, :create, :edit, :update, :destroy]
end
