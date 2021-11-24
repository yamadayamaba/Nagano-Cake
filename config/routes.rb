Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  get'customers' => 'public/customers#show', as: 'customers'
  namespace :customers do
  resources :addresses, only:[:index, :edit, :create, :update, :destoroy]
  resources :cart_items, only:[:index, :create, :destroy]
  resources :orders, only:[:new, :create, :index, :show]
  end
namespace :admin do
    get'/' => 'homes#top'
    resources :genres, only:[:index, :edit]
    resources :items, only:[:index, :new, :show, :edit]
    resources :customers, only:[:index, :show, :edit]
  end
    post'admin/genres' => 'admin/genres#create', as: 'genres'
    patch'admin/genres/:id' => 'admin/genres#update', as: 'genre'
    post'admin/items' => 'admin/items#create', as: 'items'
    patch'admin/items/:id' => 'admin/items#update', as: 'item'
    patch'admin/customers/:id' => 'admin/customers#update', as: 'customer'
    get'admin/orders' => 'admin/orders#show', as: 'admin_order'
    patch'admin/orders/:id' => 'admin/orders#update', as: 'order'
    root to: 'public/homes#top'
    get'about' => 'public/homes#about', as: 'about'
    get'customers/leave' => 'public/customers#leave', as: 'customer_leave'
    patch'customer/resign' => 'public/customers#resign', as: 'resign'
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
