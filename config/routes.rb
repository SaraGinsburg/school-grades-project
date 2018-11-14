Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  post "/signout", to: "sessions#destroy"
  get "/works/index", to: "works#index"
  post "/works/new", to: "works#new"

  resources :subjects
  resources :users

end
