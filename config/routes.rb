Rails.application.routes.draw do
  namespace :search do
    resource :analytics, only: :show
    resources :articles, only: :index
    resources :queries, only: %i[ show ]
  end

  root to: 'search/articles#index'
end
