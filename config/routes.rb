Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: redirect('/api/')

  namespace :api, path: '/', defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[create update]
      resources :tickets, only: %i[create update]
    end
  end
end
