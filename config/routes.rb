Rails.application.routes.draw do
  
  root to: 'users#index'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]

    member do
      get :following, :followers
    end
  end

  get 'users/:id', to: 'users#show'
  get 'who_to_follow', to: 'users#who_to_follow'

  resources :posts do
    resources :comments
  end
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :show, :update, :destroy]
      resources :users, only: [:show, :create, :update, :destroy]
      post 'login', to: 'sessions#create', as: :login
    end
  end
end
