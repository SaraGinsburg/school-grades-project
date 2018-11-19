Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#home"

  #SESSIONS
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"


  resources :users do
    resources :subjects
  end

  resources :subjects do
    resources :assignments
    resources :students
  end

  resources :students do
    resources :subjects
  end

end
