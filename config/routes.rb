Rails.application.routes.draw do
  resources :items
  resources :images
  resources :addresses
  resources :brands_categories
  resources :categories
  resources :brands
  resources :credit_cards
  devise_for :users
  root 'items#index'
  resources :items, only: [:new]
end
