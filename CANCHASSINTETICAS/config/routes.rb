Rails.application.routes.draw do
  get 'courts/index'
  get 'courts/new'
  get 'courts/show'
  get 'courts/edit'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'

  resources :courts

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
