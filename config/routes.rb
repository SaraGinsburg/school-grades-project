Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #SESSIONS
  root "welcome#home"
  get 'login', to: 'sessions#new'
  post "/sessions/create", to: "sessions#create"
  get "/signin", to: "sessions#new"
  get "/signout", to: "sessions#destroy", as: 'signout'
  get '/auth/google_oauth2/callback' => 'sessions#create'
  get '/auth/failure', to: redirect('/')

  get 'me', to: 'me#show', as: 'me'




  resources :users do
    resources :subjects
  end

  resources :subjects do
    resources :assignments, :only => [:create, :index, :new]
  end

  resources :subjects do
    resources :students
  end

  resources :students do
    resources :subjects
  end

end
