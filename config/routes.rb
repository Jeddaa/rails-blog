Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # resources :posts, only: [:new], as: 'new_post'
  root to: "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :create, :show, :index, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
end
