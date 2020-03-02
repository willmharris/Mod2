Rails.application.routes.draw do
  resources :dm_monsters
  resources :monsters
  resources :dms
  root 'sessions#new'
  get '/test' => 'dms#test'
  post '/test' => 'dms#add'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#logout'
end
