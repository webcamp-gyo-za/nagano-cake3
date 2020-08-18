Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'deliveries/edit'
  get 'deliveries/index'
  get 'cart_items/index'
  get 'items/index'
  get 'items/edit'
  get 'items/show'
  get 'customers/index'
  get 'customers/show'
  get 'customers/new'
  get 'customers/edit'
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
