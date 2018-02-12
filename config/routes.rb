Rails.application.routes.draw do
  devise_for :users

  mount ActionCable.server => '/cable'

  resources :persons do
    resources :fanfics do
      resources :chapters
    end
  end

  resources :read_fanfics do
    resources :read_chapters do
      resources :ratings
    end
  end

  resources :comments

  root to: "read_fanfics#index"
end
