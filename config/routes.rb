Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "groups#index"

  resources :groups do
    resources :group_posts
  end
  
  resources :users, only:[:create, :new, :show, :edit, :update]
  resource :sessions, only: [:new, :create, :destroy]
end
