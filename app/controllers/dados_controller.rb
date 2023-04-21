class DadosController < ApplicationController
    def index
      codigo_serie = params[:codigo_serie]
      dados_json = $redis.get(codigo_serie)
      if dados_json
        render json: JSON.parse(dados_json)
      else
        render json: { error: 'Dados não encontrados no Redis' }, status: :not_found
      end
    end
  end
  

  #CONTROLLER EXCLUSIVO DO REDIS (VISUAL)
  # COMANDOS INTERESSANTES
  #redis-cli keys *
  #redis-cli get <codigo_serie>
