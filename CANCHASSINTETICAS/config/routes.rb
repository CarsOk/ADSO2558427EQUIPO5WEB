Rails.application.routes.draw do
  devise_for :users
  get 'courts/index'
  get 'courts/new'
  get 'courts/show'
  get 'courts/edit'
  resources :courts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
