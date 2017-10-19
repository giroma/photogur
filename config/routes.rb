Rails.application.routes.draw do
  root 'pictures#index'
  resources :pictures
  resource :users, only: [:create, :new ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
