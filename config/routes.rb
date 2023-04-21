# config/routes.rb

Rails.application.routes.draw do
    get 'dados/:codigo_serie', to: 'dados#index'
end