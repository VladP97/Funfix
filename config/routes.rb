Rails.application.routes.draw do
  devise_for :users

  mount ActionCable.server => '/cable'

  resources :persons do
    resources :localizations
    resources :fanfics do
      resources :chapters
    end
  end

  resources :read_fanfics do
    resources :read_chapters
  end

  resources :comments

  resources :tags

  resources :searches

  resources :ratings

  root to: "read_fanfics#index"
end
