Rails.application.routes.draw do
  devise_for :usuarios, controllers: {
    sessions: 'usuarios/sessions',
    registrations: 'usuarios/registrations',
    passwords: 'usuarios/passwords',
    confirmations: 'usuarios/confirmations',
    unlocks: 'usuarios/unlocks'
  }
  devise_scope :usuario do
    get '/usuarios/sign_out', to: 'devise/sessions#destroy'
  end
  
  root to: "home#landing_page"
  get 'dashboard', to: 'home#dashboard'
  resources :canchas
  resources :clientes
  resources :reservas
  resource :usuarios
end
