Rails.application.routes.draw do
  devise_for :users
  root 'credit_cards#new'
  resources :items, only: [:new]
  resources :credit_cards, only: [:new, :create, :index, :destroy] 
end
