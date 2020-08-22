Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  devise_scope :admins do
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      passwords: 'admins/passwords',
      sessions: 'admins/sessions'
    }
  end


  namespace :admins do
    get 'homes/top', to: 'homes#top', as:'top'
    resources :orders, only: [:index, :show, :new, :update]
    resources :deliveries, only: [:edit, :index, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, only: [:new, :index,:edit, :show, :create, :update]
    resources :customers, only: [:index, :show, :new, :edit, :update]
  end


  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end

    resources :orders, only: [:index, :show, :new, :create, :update]
    resources :deliveries, only: [:edit, :index, :create, :update]
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    resources :genres, only: [:show]
      get 'order/confirm', to: 'orders#confirm'
      root to: 'items#home'
      get 'item/about', to: 'items#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
