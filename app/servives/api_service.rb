require 'httparty'

class ApiService
  include HTTParty
  
  base_uri 'https://api.bcb.gov.br/dados/serie/bcdata.sgs.11'
  default_params format: 'json'
  
  def self.busca_dados
    response = get('/dados')
    response.parsed_response
  end
end


#A linha de código @dados = ApiService.busca_dados é responsável 
#por chamar o método busca_dados do serviço ApiService e 
#armazenar o resultado na variável de instância @dados.
#O método busca_dados faz uma chamada HTTP GET à URL 
#especificada no código do serviço, utilizando a biblioteca 
#httparty para realizar a requisição. A resposta da API é então 
#convertida para um objeto JSON através do 
#método parsed_response, também fornecido pela biblioteca 
#httparty.
#Ao armazenar o resultado na variável de instância @dados, 
#essa informação pode ser utilizada posteriormente 
#na view correspondente à action 
#que invocou o método @dados.