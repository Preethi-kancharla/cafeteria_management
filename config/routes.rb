Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  put "/orders/rating", to: "orders#rating", as: :order_rating
  get "orders/all", to: "orders#all_orders", as: :all_orders
  post "orders/all", to: "orders#reports", as: :reports
  get "menus/all", to: "menus#all", as: :all_menus
  resources :menus, :menu_items, :orders, :order_items, :users
  get "/about", to: "home#about"
  get "/cart", to: "orders#cart", as: :cart
  get "/pending_orders", to: "orders#pending_orders", as: :pending_orders
  get "/sign_in", to: "sessions#new", as: :new_session
  post "/sign_in", to: "sessions#create", as: :session
  delete "/sign_out", to: "sessions#destroy", as: :destroy_session
  get "search", to: "search#search", as: :search
  patch "/users/:id/change_role", to: "users#change_role", as: :change_role
  
end


