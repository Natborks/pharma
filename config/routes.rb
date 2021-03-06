Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'pharmacist/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'
  get  '/about',   to: 'static_pages#about'
  get  '/services', to: 'static_pages#services'
  get  '/signup',    to: 'pharmacist#new'
  post '/signup',  to: 'pharmacist#create'
  root 'static_pages#home'
  resources :pharmacist
  resources :inventory

  resources :sessions, only: [:new, :create, :destroy]

  get "/login" => "sessions#new", as: "login"
  post 'login' => 'sessions#create'
  delete "/logout" => "sessions#destroy", as: "logout"
end
