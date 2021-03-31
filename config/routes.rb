Rails.application.routes.draw do

    devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  root "tops#index"

  resources :tweets

  resources :users, only: :show

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'


end
