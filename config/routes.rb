Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users do
    resources :admins, only: :index
  end
  root to: 'items#index'
  resources :items, only: [:index, :show, :new, :edit, :update, :create] do
    collection do
      get :indexAdmin
    end
  end
  resources :categories, only: [:index, :new, :edit, :update, :create]
  resources :user_items, only: [:index, :create, :destroy] do
    member do
    post :updateQuantity
    end
  end

  resources :contacts, only: [:new, :edit, :update, :create]



  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :users, only: [:admin]
  resources :item_options, only: [:index, :new, :create, :edit, :update]

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
