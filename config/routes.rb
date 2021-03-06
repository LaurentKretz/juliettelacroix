
Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'discover', to: 'pages#discover'
  get 'welcome', to: 'welcome#login', :as => :login
  post 'newsletter/subscribe', to: 'users#subscribe', as: :subscribe_to_newsletter

  scope '(:locale)', locale: /en|fr/ do
    devise_for :users, :controllers => { :invitations => 'users/invitations' }
    root to: 'pages#home'

    # resources :perfumes, only: [:show, :index]
    # resources :kits, only: [:index, :show]
    resources :order_items, only: [:create, :destroy]
    resources :orders, only: [:new, :create, :update]
    namespace :checkout do
      resource :address, only: [:edit, :create]
      resource :payment, only: [:new, :create]
      resource :confirmation, only: [:show]
    end

    namespace :account do
      resource :dashboard, only: [:show]
      resource :profile, only: [:edit, :update]
      resources :orders, only: [:index]
      resources :kits, only: [:show]
      resources :perfumes, only: [:show] do
        post "reviews/:review_id/update_review" => "reviews#update_review"
        resources :reviews, only: [:create, :update]

      end
        # post 'perfumes/step1', to: 'perfumes#step1', as: 'step1'
        # post 'perfumes/step2', to: 'perfumes#step1', as: 'step2'
        # post 'perfumes/step3', to: 'perfumes#step1', as: 'step3'
        # post 'perfumes/step4', to: 'perfumes#step1', as: 'step4'
        # post 'perfumes/step5', to: 'perfumes#step1', as: 'step5'
        # post 'perfumes/step6', to: 'perfumes#step1', as: 'step6'
    end
  # resources :coupons, except: [:index]
  # resources :kits, except: [:show]
  end
end
