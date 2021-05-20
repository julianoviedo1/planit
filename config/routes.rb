Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'categories#index'
  resources :categories, only: [:show]
  resources :suppliers, only: [:show]
end
