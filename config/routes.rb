Rails.application.routes.draw do
  devise_for :users
  resources :persons do
    resources :fanfics do
      resources :chapters
    end
  end

  root to: "persons#index"
end
