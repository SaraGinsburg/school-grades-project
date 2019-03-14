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

  # get 'user', to: 'users#show'
  # get 'student', to: 'students#show'

  get '/excelling', to: 'students#excelling'
  get '/incomplete', to: 'students_assignments#incomplete'


  resources :users do
    resources :subjects
  end

  resources :subjects do
    resources :assignments, :only => [:create, :index, :new, :show, :update]
  end

  resources :subjects do
    resources :students
  end


  resources :students do
    resources :subjects
  end


  resources :students_assignments, :only => [:index, :show, :new, :create, :update]


end
