Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  # resources :posts, only: [:new], as: 'new_post'
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post 'users/:user_id/posts/create', to: 'posts#create', as: 'create_post'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'

end
