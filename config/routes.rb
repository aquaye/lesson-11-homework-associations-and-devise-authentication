Rails.application.routes.draw do
  devise_for :users
  resources :articles, :tags, :authors
  root to: "articles#index"
end
