Rails.application.routes.draw do
  devise_for :users
  root to: 'homes/top'
  get 'homes/about'

  resources :users, only: [:create, :index, :edit, :show, :destroy]
  resources :books, only: [:create, :index, :edit, :show, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
