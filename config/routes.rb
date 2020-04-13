Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :order_items
  resources :items
  resources :shops
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
