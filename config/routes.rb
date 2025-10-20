Rails.application.routes.draw do
  root "filmes#index"
  get "filmes", to: "filmes#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Autenticação
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Usuários
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#profile'
  resources :users, only: [:create, :edit, :update]
end