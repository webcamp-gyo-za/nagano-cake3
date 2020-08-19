Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  resources :orders, only: [:index, :show, :new]
  resources :deliveries, only: [:edit, :index]
  resources :cart_items, only: [:index]
  resources :items, only: [:index,:edit, :show]
  resources :customers, only: [:index, :show, :new, :edit]

  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
