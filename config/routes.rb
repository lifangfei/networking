Rails.application.routes.draw do
  root "home#index"
  resources :users, :lists, :connections, :interactions, :sessions
  resources :home, only: :index
end
