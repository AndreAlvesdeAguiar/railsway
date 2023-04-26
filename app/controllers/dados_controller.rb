class DadosController < ActionController::Base
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

  def grafico 
    # Carrega os dados necessários para o gráfico em um formato compreensível pelo Chart.js
    codigo_serie = params[:codigo_serie]
    dados_json = $redis.get(codigo_serie)
    if dados_json.nil?
      dados = ApiService.busca_dados(codigo_serie)
      dados_json = dados.to_json
      $redis.set(codigo_serie, dados_json)
    end
    dados = JSON.parse(dados_json)

  
    labels = []
    valores = []
    dados.each do |dado|
      labels << dado['data']
      valores << dado['valor']
    end
  
    @dados_grafico = {
      labels: labels,
      datasets: [
        {
          label: 'Valores',
          data: valores,
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgba(255, 99, 132, 1)',
          borderWidth: 1
        }
      ]
    }
  
    render 'dados/grafico'
  end

  # def get_significado(codigo_serie)
  #   serie = Serie.find_by(codigo: codigo_serie)
  #   serie.significado
  # https://www3.bcb.gov.br/sgspub/consultarmetadados/consultarMetadadosSeries.do?method=consultarMetadadosSeriesInternet&hdOidSerieSelecionada=12
  # end
  
end



  #CONTROLLER EXCLUSIVO DO REDIS (VISUAL)
  # COMANDOS INTERESSANTES
  #redis-cli keys *
  #redis-cli get <codigo_serie>
