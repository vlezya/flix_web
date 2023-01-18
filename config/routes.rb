Rails.application.routes.draw do
  get 'reviews/index'
  root "movies#index"
  resources :movies do
    resources :reviews
  end
end
