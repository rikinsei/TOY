# frozen_string_literal: true

Rails.application.routes.draw do
root 'static_pages#home'
  resources :categories
  resources :comments
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :microposts  do
    resources :comments
  end
  resources :users
  # http://0.0.0.0:3000/microposts/12/comments
end
