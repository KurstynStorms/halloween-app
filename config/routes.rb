Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  root to: "home#index"
  resources :users
  resources :movies do
    resources :reviews
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
