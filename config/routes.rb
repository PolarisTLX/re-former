Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  resources :users, only: %i[new create edit update]
  # resources :users, only: [:new, :create, :edit, :update]
end
