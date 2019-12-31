Rails.application.routes.draw do
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :customers
  resources :households

  root 'static_pages#home'
  get '/dashboard', to: 'dashboard#index'
end
