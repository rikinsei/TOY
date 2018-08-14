# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :categories
  resources :comments
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :microposts  do
    resources :comments
  end
  resources :users
  root 'users#index'
  get 'static_pages/home'
  # http://0.0.0.0:3000/microposts/12/comments
end
