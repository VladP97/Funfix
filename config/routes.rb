Rails.application.routes.draw do
  devise_for :users
  resources :persons do
    resources :fanfics do
      resources :chapters
    end
  end

  resources :read_fanfics do
    resources :read_chapters
  end

  root to: "read_fanfics#index"
end
