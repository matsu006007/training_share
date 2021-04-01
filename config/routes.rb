Rails.application.routes.draw do

    devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }

  root "tops#index"

  resources :tweets do
    resources :messages, only: [:create, :destroy]
  end

  resources :users, only: :show

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'


end
