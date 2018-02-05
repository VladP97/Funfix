Rails.application.routes.draw do
  devise_for :users
  resources :persons do
    resources :fanfics do
      resources :chapters
    end
  end

  # mount Markitup::Rails::Engine, at: "markitup", as: "markitup"

  root to: "persons#index"
end
