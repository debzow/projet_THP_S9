Rails.application.routes.draw do

  #Carts routes
  get 'carts/show', to:'carts#show'
  post 'carts/create', to:'carts#create'
  post 'carts/add_item/:item_id', to:'carts#add_item', as: 'carts_add_item'
  post 'carts/remove_item', to:'carts#remove_item'
  post 'carts/reset', to:'carts#reset'

  get'/store', to:'store#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :charges
  resources :home
end
