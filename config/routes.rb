Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'images#index'
  resources :images
  resources :image_comments
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
