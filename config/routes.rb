Rails.application.routes.draw do
  devise_for :customers
  devise_scope :admins do
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      passwords: 'admins/passwords',
      sessions: 'admins/sessions'
    }
  end
  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end

  namespace :admins do
    get 'homes/top' => 'homes#top', as:'top'
    resources :orders, only: [:index, :show, :new]
    resources :deliveries, only: [:edit, :index]

    resources :items, only: [:index,:edit, :show]
    resources :customers, only: [:index, :show, :new, :edit]
  end
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
