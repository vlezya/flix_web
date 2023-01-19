Rails.application.routes.draw do
  resources :users
  get 'reviews/index'
  root "movies#index"
  resources :movies do
    resources :reviews
  end
end
