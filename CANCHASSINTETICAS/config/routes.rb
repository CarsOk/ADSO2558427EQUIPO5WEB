Rails.application.routes.draw do
 devise_for :usuarios
  devise_scope :usuario do
    get '/usuarios/sign_out', to: 'devise/sessions#destroy'
  end
  root to: "home#landing_page"
  get 'dashboard', to: 'home#dashboard'
  resources :canchas
  resources :clientes
  resources :reservas
end
