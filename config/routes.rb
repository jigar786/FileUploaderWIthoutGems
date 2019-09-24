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
  get "/user_files/:id/downloads" => "user_files#download", as: "download_file"
  post "shared_files/:id" => "shared_files#create", as: "shared_file"
  get "shared_file/:id/:filename" => "shared_files#show", as: "downloaded_file"
  delete "unshared_file/:id" => "shared_files#destroy", as: "unshared_file"
  resources :shared_files, only: [:show]
  resources :users, only: [:create, :show, :home]
  resources :user_files, only: [:create, :destroy]
end
