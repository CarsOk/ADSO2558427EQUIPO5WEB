Rails.application.routes.draw do
  devise_for :users
  root to: 'home#dashboard'
  resources :canchas
  resources :clientes
  resources :facturas
end
