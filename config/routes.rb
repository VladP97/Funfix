Rails.application.routes.draw do
  devise_for :users
  resources :persons

  root to: "persons#index"
end
