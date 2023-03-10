Rails.application.routes.draw do
  root 'movies#index'

  resources :users
  get 'signup' => 'users#new'

  resource :session, only: %i[create destroy]
  get 'signin' => 'sessions#new'

  resources :genres
  resources :movies do
    resources :reviews
    resources :favorites, only: %i[create destroy]
  end

  get 'movies/filter/:filter', to: 'movies#index', as: :filtered_movies
end
