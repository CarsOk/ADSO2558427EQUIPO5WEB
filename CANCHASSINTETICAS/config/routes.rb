Rails.application.routes.draw do
  devise_for :administrador, controllers: {
    sessions: 'administrador/sessions',
    registrations: 'administrador/registrations'
  }
  devise_scope :administrador do
    get '/administrador/sign_out', to: 'devise/sessions#destroy'
  end

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
  get 'admin', to: 'home#admin'
  resources :canchas
  resources :clientes
  resources :reservas
end
