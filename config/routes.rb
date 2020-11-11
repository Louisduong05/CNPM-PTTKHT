Rails.application.routes.draw do
  scope "(:locale)", locale: /vi|en/, defaults: {locale: "vi"} do
    devise_for :users

    root "home#index"

    resources :products do
      member do 
        put :unactive
      end
    end

    # resources :product_items,   only: [:index]

    resources :suppliers,       only: [:index, :new, :create, :edit, :update, :destroy]

    # resources :exported_items,  only: [:index, :edit, :update]

    resources :exports,         only: [:index, :show, :new, :create]

    # resources :imported_items,  only: [:index, :edit, :update]

    resources :imports,         only: [:index, :show, :new, :create]

    resources :brands,          only: [:index, :new, :create, :edit, :update, :destroy]

    resources :accounts,        only: [:index, :show, :new, :create, :edit, :update, :destroy]

    resources :customers,       only: [:index, :new, :create, :edit, :update, :destroy]

    resources :warehouses,      only: [:index]

    resources :statistical,      only: [:index]

    resources :notifications,   only: [:index] do 
      collection do 
        patch :seen
        get :show_all
      end
    end

    namespace :api do
      resources :warehouses,    only: [:index]
      resources :statistical,   only: [:index]
    end
  end
end
