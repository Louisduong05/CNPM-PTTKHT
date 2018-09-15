Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :products, only: [:index]
  resources :suppliers, only: [:index]

end
