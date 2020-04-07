Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "bootstrap", to: "artists#bootstrap"
  get "users", to: "users#index"
  get "admins", to: "users#sigin_in"
  get "users/new", to: "users#new"
  post "users", to: "users#create"
  get "users/:id/edit", to: "users#edit", as: :user_edit
  patch "users/:id", to: "users#update"

  get "users/export", to: "users#export"

  get "users/:id/delete", to: "users#destroy"
  delete "users/:id", to: "users#destroy"

  get "users/:id", to: "users#show", as: :user
  get 'pages/home'
  root 'pages#home'

  resources :users

end
