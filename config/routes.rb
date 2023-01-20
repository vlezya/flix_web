Rails.application.routes.draw do
  root "movies#index"
  
  resources :users
  get "signup" => "users#new"
  
  resource :session, only: [:create, :destroy]
  get 'signin' => 'sessions#new'
  
  
  resources :movies do
    resources :reviews
  end
end
