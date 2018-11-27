Rails.application.routes.draw do

  #Carts routes
  get 'carts/show', to:'carts#show'
  put 'carts/create', to:'carts#create'
  put 'carts/add_item', to:'carts#add_item'
  put 'carts/remove_item', to:'carts#remove_item'
  put 'carts/reset', to:'carts#reset'

  get'/store', to:'store#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :charges
end
