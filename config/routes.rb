Rails.application.routes.draw do
  resources :dm_monsters
  resources :monsters
  resources :dms
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add/:id' => 'monsters#add'
  root 'sessions#new'
end
