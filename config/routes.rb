Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  get '/', to: 'categories#index'
  resources :categories, only: [:show]
  resources :suppliers, only: [:show]
  resources :orders, only: %i[index create edit]
end
