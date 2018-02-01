Rails.application.routes.draw do
  devise_for :users
  resources :person

  root to: "persons#index"
end
