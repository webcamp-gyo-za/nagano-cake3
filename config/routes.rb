Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  devise_scope :admins do
    devise_for :admins, controllers: {
      registrations: 'admins/admins/registrations',
      passwords: 'admins/admins/passwords',
      sessions: 'admins/admins/sessions'
    }
  end

  get 'admins/top', to: 'admins#top', as:'admins_top'
  namespace :admins do
    resources :orders, only: [:index, :show, :new, :update]
    resources :deliveries, only: [:edit, :index, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, only: [:new, :index,:edit, :show, :create, :update]
    resources :customers, only: [:index, :show, :new, :edit, :update,]
    resources :order_details, only: [:update]
  end


  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end
    get 'order/new', to: 'customers/orders#new'
    post 'order/confirm', to: 'customers/orders#confirm'
    root to: 'items#home'
    get 'item/about', to: 'items#about'
    get 'order/thanks', to: 'customers/orders#thanks'
    get 'search/search'
    get 'withdrawal' => 'customers#withdrawal'
    put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
    post '/orders', to: 'customers/orders#create'

    resources :orders, only: [:index, :show, :update]
    resources :deliveries, only: [:edit, :index, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update,:destroy]
    resources :genres, only: [:show]
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
