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
  
  # namespace :api, path: '/', constraints: { subdomain: 'api' } do
  #   resources :users, only: [:index, :show]
  #   resources :posts, only: [:index, :show]
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :show, :update, :destroy]
      resources :users, only: [:show, :create, :update, :destroy]
      # devise_for :users, :controllers => {sessions: 'api/v1/sessions', registrations: 'api/v1/registrations'}
    end
  end
end
