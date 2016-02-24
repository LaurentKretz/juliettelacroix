Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'orders/create'

  scope '(:locale)', locale: /en/ do
    devise_for :users
    root to: 'pages#home'

    # resources :perfumes, only: [:show, :index]
    # resources :kits, only: [:index, :show]
    resources :orders, only: [:create]
      namespace :checkout do
        resource :address, only: [:edit, :update]
        resource :payment, only: [:new, :create]
        resource :confirmation, only: [:show]
      end

      namespace :account do
        resource :dashboard, only: [:show]
        resource :profile, only: [:edit, :update]
        resources :orders, only: [:index]
        resources :kits, only: [:show]
        resources :perfumes, only: [:show] do
          resources :reviews, only: [:create, :update]
        end
      end
  # resources :coupons, except: [:index]
  # resources :kits, except: [:show]
  end
end
