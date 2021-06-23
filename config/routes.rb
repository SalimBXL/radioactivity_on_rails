Rails.application.routes.draw do

  root 'home#index'

  resources :clients
  resources :tracers
  resources :productions, param: :identifier
  resources :stats

  get '/:identifier', to: 'productions#show'

end
