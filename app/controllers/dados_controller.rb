class DadosController < ApplicationController
  def index
    codigo_serie = params[:codigo_serie]
    dados_json = $redis.get(codigo_serie)

    if dados_json.nil?
      dados = ApiService.busca_dados(codigo_serie)
      dados_json = dados.to_json
      $redis.set(codigo_serie, dados_json)
    end

    render json: JSON.parse(dados_json)
  end
end


  #CONTROLLER EXCLUSIVO DO REDIS (VISUAL)
  # COMANDOS INTERESSANTES
  #redis-cli keys *
  #redis-cli get <codigo_serie>
