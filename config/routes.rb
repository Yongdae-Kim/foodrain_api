Rails.application.routes.draw do
  resources :common_codes
  resources :users
  resources :store_owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
