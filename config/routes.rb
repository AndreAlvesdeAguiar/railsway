Rails.application.routes.draw do
  get 'dados/:codigo_serie', to: 'dados#index'
  get 'dados/:codigo_serie/grafico', to: 'dados#grafico'
end
