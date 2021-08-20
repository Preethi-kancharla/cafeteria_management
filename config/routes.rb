Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'about', to: 'home#about'
  get "menus/all", to: "menus#all", as: :all_menus
  resources :menus, :menu_items


  
end


