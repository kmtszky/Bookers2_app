Rails.application.routes.draw do
  get 'books/index'
  get 'books/edit'
  get 'books/show'
  devise_for :users
  root to: 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
