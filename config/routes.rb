Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/register', to: 'users#new'
  # get '/login', to: 'users#login'
  # post '/login', to: 'users#login_user'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # resources :users, only: [:show, :create] do
  resources :users, only: [:create] do
    get '/dashboard', to: 'users#show'
    get '/discover', to: 'users#discover'
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:new, :create]
    end
  end
end
