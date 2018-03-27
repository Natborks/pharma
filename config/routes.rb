Rails.application.routes.draw do
  get 'pharmacist/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'
  get  '/about',   to: 'static_pages#about'
  get  '/services', to: 'static_pages#services'
  get  '/signup',    to: 'pharmacist#new'
  post '/signup',  to: 'pharmacist#create'
  root 'static_pages#home'
  resources :pharmacist
end
