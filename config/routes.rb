Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'categories#index'
  resources :users, only: %i[edit update]
  resources :categories, only: [:show]
  resources :suppliers, only: [:show]
  resources :services, only: [:show]
  resources :orders, only: %i[create index show edit update]
end
