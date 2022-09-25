Rails.application.routes.draw do
  get 'search', to: 'search#index'
  get    'sessions/new'
  get    'users/new'
  root   'dash_board#home'
  get    '/home',    to: 'dash_board#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
 # get    '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :projects 
  resources :accesses
  resources :comments
  resources :features do
    member do
      patch "document"
    end
  end
  resources :tasks do
    member do
      patch "status"
      patch "done"
      patch "user_id"
    end
  end
  get '/features', to: 'projects#show'
  get '/projects/:id/currentiteration', to:'projects#currentiteration', as: 'currentiteration_project'
  get '/projects/:id/backlog', to:'projects#backlog', as: 'backlog_project'
  get '/projects/:id/icebox', to:'projects#icebox', as: 'icebox_project'
  post '/tasks/:id/edit', to:'comments#create'
end
