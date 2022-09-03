Rails.application.routes.draw do
  # get 'search/index'
  # get 'friends/index'
  # get 'friends/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"

  resources :groups do
    resources :memberships, shallow: true, only: [:create, :destroy]
    resources :group_posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, shallow: true, only: [:create, :destroy]
    end
  end
  
  resources :users, only:[:create, :new, :show, :edit, :update, :index, :destroy]
  resource :sessions, only: [:new, :create, :destroy]

  get 'search', to: 'search#index'
  resources :events
  post '/users/:user_id/events/:id', to: "attending_events#create", as: "create_attending_event"
  get '/users/:id/attended_events', to: "user#show_attended_events", as: "show_attended_events"
  delete '/users/:user_id/events/:id', to: "attending_events#destroy", as: "destroy_attending_event"


  get 'invitations/update'
  get 'invitations/create'
  get 'invitations/destroy'
  get 'invitations/destroy_from_panel'
  get 'invitations/unsent'

  get 'userpanel', to: 'users#user_panel', as: :show_user_panel

end
