Rails.application.routes.draw do
  root 'pictures#index'
  resources :pictures
  resource :users, only: [:create, :new ]
  resource :sessions, only: [:create, :new, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
