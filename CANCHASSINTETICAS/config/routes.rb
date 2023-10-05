Rails.application.routes.draw do
  root to: 'home#dashboard'
  resources :canchas
  resources :clientes
  resources :reservas
end
