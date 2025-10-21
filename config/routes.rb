Rails.application.routes.draw do
  root "movies#index"  
  get "movies", to: "movies#index"  
  get "up" => "rails/health#show", as: :rails_health_check


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  

  get 'signup', to: 'users#new'
  get 'profile', to: 'users#profile'
  resources :users, only: [:create, :edit, :update]
  
  
  resources :movies
end