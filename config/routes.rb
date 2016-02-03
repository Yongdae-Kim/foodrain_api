Rails.application.routes.draw do
  get 'welcome/index'

  resources :regions
  resources :store_menus
  resources :reviews
  resources :stores
  resources :common_codes
  resources :users
  resources :store_owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :regions, only: :index
    resources :categories, only: :index
    resources :reviews, only: :index
    resources :stores, only: [:index, :show] do
      resources :reviews, only: :index
    end
    resources :users, only: :index do
      collection do
        get :reviews
        post :modify
        post :authentication
        post :signup
        post :signin
      end
    end
  end
  match "/api/users/reviews/update" => "api/users#update", via: :post
  match "/api/users/reviews/destroy" => "api/users#destroy", via: :post
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
