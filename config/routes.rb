Rails.application.routes.draw do
  get 'process_orders/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :products do
    collection do
      get 'view_product'
      get 'update_order_status'
    end
  end
  resources :home
  resources :carts
  resources :cart_products
  resources :products
  resources :orders
  resources :process_orders
  root to: 'home#index'
end
