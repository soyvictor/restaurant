Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :admins, only: :index
  end
  root to: 'items#index'
  resources :items, only: [:index, :show, :new, :edit, :create]
  resources :categories, only: [:new, :edit, :create]
  resources :user_items, only: [:index, :create]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :users, only: [:admin]

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
