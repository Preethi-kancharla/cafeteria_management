Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'about', to: 'home#about'
  resources :menus, :menu_items, :orders, :order_items, :users
  get "/sign_in", to: "sessions#new", as: :new_session
  post "/sign_in", to: "sessions#create", as: :session
  delete "/sign_out", to: "sessions#destroy", as: :destroy_session


  
end


