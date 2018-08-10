# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :microposts  do
    resources :comments
  end
  root 'microposts#index'
  resources :users
  root 'users#index'
  get 'comments/index'
  # http://0.0.0.0:3000/microposts/12/comments
end
