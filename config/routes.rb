Rails.application.routes.draw do
  root "home#index"
  resources :users, :lists, :connections, :interactions
  resources :home, only: :index
end
