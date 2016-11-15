Rails.application.routes.draw do
  
  root to: 'application#home'

  devise_for :users

  resources :users do
    resources :relationships, only: [:create, :destroy]

    member do
      get :following, :followers
    end
  end

  get 'users/:id' => 'users#show'

  resources :posts do
    resources :comments
  end

end
