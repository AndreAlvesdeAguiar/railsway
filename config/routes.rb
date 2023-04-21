# config/routes.rb
require 'sidekiq/web'

Rails.application.routes.draw do
  # ...
  mount Sidekiq::Web => "/sidekiq"
  # ... Se a aplicação for uma aplicação Rails, 
  # a solução é montar o Sidekiq::Web dentro das rotas da 
  # aplicação, para que ele possa herdar as configurações 
  # de sessão da aplicação. Por exemplo:
end