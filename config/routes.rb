Rails.application.routes.draw do
  resources :dm_monsters
  resources :monsters
  resources :dms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
