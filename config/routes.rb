# frozen_string_literal: true

Rails.application.routes.draw do
  resources :gifs, only: [:index, :show, :update], param: :giphy_id do
    member do
      put 'favorite'
    end
    collection do
      get 'search'
      get 'trending'
      get 'random'
    end
  end

  resources :favorites, only: [:create]

  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
