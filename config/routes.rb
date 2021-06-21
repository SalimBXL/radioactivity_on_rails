Rails.application.routes.draw do

  root 'home#index'

  resources :clients
  resources :tracers
  resources :productions, param: :identifier

  get '/:identifier', to: 'productions#show'
  
end
