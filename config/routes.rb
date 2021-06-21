Rails.application.routes.draw do

  root 'home#index'

  resources :clients
  resources :tracers
  resources :productions
  
end
