Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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

  namespace :api, :defaults => {:format => :json}  do
    resources :users do
      resources :posts, only: [:index, :show, :create, :destroy] do
        resources :comments, only: [:index, :show, :create, :destroy]
      end
    end
  end
end
