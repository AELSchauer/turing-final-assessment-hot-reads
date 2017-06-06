Rails.application.routes.draw do
  root 'hot_reads#index'

  resources :hot_reads, only: :index

  namespace :api do
    namespace :v1 do
      resources :read_urls, only: :create
      resources :hot_reads, only: :index
    end
  end
end
