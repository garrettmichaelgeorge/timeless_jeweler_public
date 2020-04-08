Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :customers
  resources :households
  resources :products
  resources :reports
  get       'dashboard' => 'reports#index'
  # Login and Logout
  get       'login'      => 'sessions#new'
  get       'login'      => 'sessions#create'
  delete    'logout'     => 'sessions#destroy'
end
