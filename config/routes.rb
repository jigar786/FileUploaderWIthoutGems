Rails.application.routes.draw do
  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'sessions/new'

  # get "users/home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#home"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :users
end
