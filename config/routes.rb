Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :products,        only: [:index, :new, :create, :edit, :update, :destroy, :show]

  resources :suppliers,       only: [:index, :new, :create, :edit, :update, :destroy]

  resources :exported_items,  only: [:index, :new, :create]

  resources :exports,         only: [:index, :show, :new, :create]

  resources :imported_items,  only: [:index, :new, :create]

  resources :imports,         only: [:index, :show, :new, :create]

  resources :brands,          only: [:index, :new, :create, :edit, :update, :destroy]

  resources :accounts,        only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :customers,       only: [:index, :new, :create, :edit, :update, :destroy]

  resources :notifications,       only: [:index] do 
    collection do 
      patch :seen
    end
  end


end
