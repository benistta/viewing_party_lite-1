Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/register', to: 'users#new'
  resources :users, only: [:show]
  # get '/login', to: 'sessions#new', as: 'login_form'
  
end
