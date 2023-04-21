require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # sidekiq infos
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      # launchers
      get '/', to: 'launchers#message'
      get '/import_launchers', to: 'launchers#import_launchers'
      resources :launchers
      # tokens
      get '/get_token', to: 'tokens#token'
    end
  end
end
