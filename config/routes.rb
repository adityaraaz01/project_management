Rails.application.routes.draw do
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
end
