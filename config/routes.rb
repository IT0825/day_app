Rails.application.routes.draw do

  root to: "reports#index"

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :reports do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  
end
