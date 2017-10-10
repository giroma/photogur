Rails.application.routes.draw do
  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  get 'pictures/new' => 'pictures#new'
  post 'pictures' => 'pictures#create'

  get 'pictures/:id' => 'pictures#show'

  get 'pictures/:id/edit' => 'pictures#edit'
  patch 'pictures/:id' => 'pictures#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
