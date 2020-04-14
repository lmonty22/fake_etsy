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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
