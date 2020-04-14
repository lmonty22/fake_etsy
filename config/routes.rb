Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :order_items
  resources :items
  resources :shops do 
    get "my_shop", to: "shops#shop_owner_show", on: :member
  end
  resources :users

  # get "/:id/my_shop", to: "shops#shop_owner_show"

  get '/login', to: "sessions#login"
  post '/login', to: "sessions#process_login"

  get '/logout', to: 'sessions#logout'
  post '/items/:id/add_to_cart', to: 'items#add_to_cart', as: "add_to_cart"
  post '/items/:id/remove_from_cart', to: 'items#remove_from_cart', as: "remove_from_cart"
  get 'users/:id/my_cart', to: "users#my_cart", as: "my_cart"
  post '/users/:id/my_cart', to: "order_items#checkout", as: "checkout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
