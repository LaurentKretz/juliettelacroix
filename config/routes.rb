Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :perfumes do
    resources :reviews
  end
  resources :coupons, except: [:index]
  resources :kits, except: [:show]
  resources :orders


end
