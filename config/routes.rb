Rails.application.routes.draw do 
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :users, only: [:show, :destroy]
  resources :items
  root 'credit_cards#new'
  resources :credit_cards, only: [:new, :create, :index, :destroy] 
end
