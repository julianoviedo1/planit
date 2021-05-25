Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'categories#index'
  resources :orders, only: %i[index show]
  resources :users, only: %i[edit update]
  resources :categories, only: [:show]
  resources :suppliers, only: [:show]
  resources :services, only: [:show] do
    resources :orders, only: %i[new create]
  end
end
