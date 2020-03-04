Rails.application.routes.draw do
  resources :monsters
  resources :dms
  resources :actions 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add/:id' => 'monsters#add'
  post '/remove/:id' => 'monsters#remove'
  post '/add_action/:id' => 'monsters#add_action'
  post '/update_action' => 'monsters#update_action'
  root 'sessions#new'
end
