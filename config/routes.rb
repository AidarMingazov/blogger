Rails.application.routes.draw do
  
  root to: 'users#index'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]

    member do
      get :following, :followers
    end
  end

  get 'users/:id' => 'users#show'
  get 'who_to_follow' => 'users#who_to_follow'

  resources :posts do
    resources :comments
  end

end
