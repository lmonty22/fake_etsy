Rails.application.routes.draw do
  resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :shops do 
    get "my_shop", to: "shops#shop_owner_show", on: :member
  end
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  get '/login', to: "sessions#login"
  post '/login', to: "sessions#process_login"
  get '/logout', to: 'sessions#logout'
  post '/items/:id/add_to_cart', to: 'items#add_to_cart', as: "add_to_cart"
  post '/items/:id/remove_from_cart', to: 'items#remove_from_cart', as: "remove_from_cart"
  get 'users/:id/my_cart', to: "users#my_cart", as: "my_cart"
  post '/users/:id/my_cart', to: "order_items#checkout", as: "checkout"
  get '/', to: "items#home", as: "home"
  patch '/items/:id/status', to: "items#change_item_listing", as: "status"
  patch '/shops/:id/status', to: "shops#change_shop_status", as: "shop_status"
  get '/shops/:id/shop_orders', to: "shops#shop_orders", as: "shop_orders"

  get "/analytics", to: "application#analytics"

  #build a homepage someday


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
