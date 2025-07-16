Rails.application.routes.draw do
  get "home/index"
  root "home#index"

  devise_for :users

  get 'hello/index' => 'hello#index'
  get 'hello/link'  => 'hello#link'

  resources :users, only: [:show]
  resources :likes, only: [:index]

  resources :tweets do
    resources :likes, only: [:create, :destroy]  # ← これでPOSTとDELETEが自動的に生成される
    resources :comments, only: [:create]
  end

  resources :orders, only: [:create, :show, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
