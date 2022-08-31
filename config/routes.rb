Rails.application.routes.draw do
  get 'search/index'
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "groups#index"

  resources :groups do
    resources :memberships, shallow: true, only: [:create, :destroy]
    resources :group_posts do
      resources :comments, only: [:new, :create, :destroy]
    end
  end
  
  resources :users, only:[:create, :new, :show, :edit, :update, :index]
  resource :sessions, only: [:new, :create, :destroy]
  resources :friendships

  get 'search/', to: "search#index"

end
