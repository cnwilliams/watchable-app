Rails.application.routes.draw do
  root to: "movies#index"

  resources :lists
  resources :movies
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/list_movies", to: "list_movies#create", as: "create_list_movie"
end
