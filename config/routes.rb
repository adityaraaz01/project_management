Rails.application.routes.draw do
  root   'dash_board#home'
  get    '/home',    to: 'dash_board#home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
