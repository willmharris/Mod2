Rails.application.routes.draw do
  resources :monsters
  resources :dms
  resources :actions, only: [:create, :update, :destroy]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add/:id' => 'monsters#add'
  post '/remove/:id' => 'monsters#remove'
  post '/monsters/order' => 'monsters#order'
  root 'sessions#new'
end
