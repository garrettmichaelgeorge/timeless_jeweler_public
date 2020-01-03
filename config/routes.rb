Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers
  resources :households
  resources :products
  resources :reports
  get       '/dashboard', to: 'reports#index'

  root 'static_pages#home'
end
