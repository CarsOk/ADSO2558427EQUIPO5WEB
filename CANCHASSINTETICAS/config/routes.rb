Rails.application.routes.draw do

  devise_for :usuarios, controllers: {
    sessions: 'usuarios/sessions',
    registrations: 'usuarios/registrations'
  }
  get '/usuarios', to: 'usuarios#index', as: 'usuarios_index'
  
  devise_scope :usuario do
    get '/usuarios/sign_out', to: 'devise/sessions#destroy'
    get '/user_profile', to: 'usuarios/registrations#show', as: :user_profile
    get '/user_profile/edit', to: 'usuarios/registrations#edit', as: :edit_user_profile
    put '/user_profile', to: 'usuarios/registrations#update', as: :update_user_profile
  end
  
  root to: "home#landing_page"
  get 'dashboard', to: 'home#dashboard'
  resources :canchas
  resources :reservas
  resources :comentarios
end
