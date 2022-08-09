Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'dash_board#home'
  get '/home', to: 'dash_board#home'
end
