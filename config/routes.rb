Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "root#index"

  get '/users/categories/new', to: 'groups#new'
  post '/users/categories/create', to: 'groups#create'
  get '/users/:id/categories', to: 'groups#index'

  get '/users/transactions/new', to: 'transaction_infos#new'
  post '/users/transactions/create', to: 'transaction_infos#create'
  get '/users/:id/categories/:group_id', to: 'transaction_infos#index'
end
