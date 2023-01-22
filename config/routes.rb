Rails.application.routes.draw do
  resources :genres
  root "movies#index"
  
  resources :users
  get "signup" => "users#new"
  
  resource :session, only: [:create, :destroy]
  get 'signin' => 'sessions#new'
  
  
  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end
end
