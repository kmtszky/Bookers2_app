Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  has_many :books, dependent: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
