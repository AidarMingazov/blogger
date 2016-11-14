Rails.application.routes.draw do
  
  root to: 'application#home'

  devise_for :users

	resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships

  get 'users/:id' => 'users#show'

  resources :posts do
    resources :comments
  end

end
