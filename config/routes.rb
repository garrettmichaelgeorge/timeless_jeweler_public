Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root      'sessions#new'
  resources :parties
  resources :people
  resources :households
  get       'dashboard' => 'static_pages#dashboard'

  # Login and Logout
  get       'login'      => 'sessions#new'
  get       'login'      => 'sessions#create'
  delete    'logout'     => 'sessions#destroy'
end
