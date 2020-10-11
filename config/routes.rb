Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :users, only: %i(index show destroy edit)
  resources :questions, only: %i(index create show new)
  resources :answers, only: %i(index create)
end
