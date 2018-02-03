Rails.application.routes.draw do
  devise_for :users
  resources :persons do
    resources :fanfics
  end

  root to: "persons#index"
end
