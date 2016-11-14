Rails.application.routes.draw do
  
  root to: 'application#home'

  devise_for :users
 
  resources :posts do
  	resources :comments
	end

	resources :users do
    member do
      get :following, :followers
    end
  end
end
