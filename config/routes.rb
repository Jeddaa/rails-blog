Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # resources :posts, only: [:new], as: 'new_post'
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :create, :show, :index] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
end
