Rails.application.routes.draw do
  devise_for :users
  resources :persons do
    resources :fanfics do
      resources :chapters
    end
  end

  resources :read_fanfics

  root to: "read_fanfics#index"
end
