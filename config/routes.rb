Rails.application.routes.draw do

  resources :clients
  root 'productions#index'
  
  resources :tracers
  resources :productions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
