# config/routes.rb
Rails.application.routes.draw do
  root "movies#index"
  get "movies", to: "movies#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Autenticação
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  # Usuários
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#profile'
  resources :users, only: [:create, :edit, :update]
  
  # Filmes
  resources :movies do
    # Comentários
    resources :comentarios, only: [:create, :destroy]
  end
end