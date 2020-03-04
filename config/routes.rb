Rails.application.routes.draw do
  resources :monsters
  resources :dms
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add/:id' => 'monsters#add'
  post '/remove/:id' => 'monsters#remove'
  post '/add_action' => 'actions#create'
  post '/update_action' => 'actions#update'
  root 'sessions#new'
end
