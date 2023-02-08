# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :tweets, only: [:create, :show] do
    resources :likes, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    resources :retweets, only: [:create, :destroy]
    resources :reply_tweets, only: :create
  end

  get :dashboard, to: 'dashboard#index'
  get :profile, to: 'profile#show'

  resources :usernames, only: [:new, :update]
end
