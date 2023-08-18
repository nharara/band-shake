Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :offerings, only: %i[index create new show] do
    resources :bookings, only: :create
    resources :reviews, only: :create
  end
  resources :bookings, only: %i[index update]
end
