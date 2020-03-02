Rails.application.routes.draw do
  resources :dm_monsters
  resources :monsters
  resources :dms
  root 'dms#welcome'
  get '/test' => 'dms#test'
  post '/test' => 'dms#add'
  get '/welcome', to: 'dms#welcome'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#validate'
  post '/logout', to: 'sessions#logout'
end
