Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :read_urls, only: :create
      resources :hot_reads, only: :index
    end
  end
end
