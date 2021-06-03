Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'categories#index'
  resources :users, only: %i[edit update]
  resources :categories, only: [:show]
  resources :suppliers, only: [:show]
  resources :payments, only: %i[index show new edit create update]
  resources :services, only: [:show] do
    resources :orders, only: %i[create]
  end
  resources :orders, only: %i[index show edit update] do
    collection do
      get :confirm
    end
    member do
      post :update_payment
    end
  end
end
