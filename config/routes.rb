Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'categories#index'
  resources :categories, only: [:show] do
    resources :services, only: [:show]
  end
end
