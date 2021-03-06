Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  get  "top/about"  => "top#about"
  resources :users, only: %i(show destroy edit)
  resources :questions, only: %i(index create show new destroy)
  resources :answers, only: %i(create)
end
