Rails.application.routes.draw do
  resources :dm_monsters
  resources :monsters
  resources :dms
  root 'dms#index'
  post '/test' => 'dms#add'
  get '/test' => 'dms#test'
end
