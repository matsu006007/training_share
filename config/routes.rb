Rails.application.routes.draw do

  devise_for :users
  root "tops#index"

  resources :tweets

  resources :users, only: :show

end
