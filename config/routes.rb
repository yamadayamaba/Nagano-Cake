Rails.application.routes.draw do
namespace :admin do
    get'/' => 'homes#top'
    resources :genres, only:[:index, :edit]
    resources :items, only:[:index, :new, :show, :edit]
  end
    post'admin/genres' => 'admin/genres#create', as: 'genres'
    patch'admin/genres/:id' => 'admin/genres#update', as: 'genre'
    post'admin/items' => 'admin/items#create', as: 'items'
    patch'admin/items/:id' => 'admin/items#update', as: 'item'
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
