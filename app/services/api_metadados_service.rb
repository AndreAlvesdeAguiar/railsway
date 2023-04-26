require 'open-uri'
require 'nokogiri'

# class ApiMetadadosService
#   def self.busca_metadados(codigo_serie)
#     # url = "https://www3.bcb.gov.br/sgspub/consultarmetadados/consultarMetadadosSeries.do?method=consultarMetadadosSeriesInternet&hdOidSerieSelecionada=#{codigo_serie}"
#     # html = URI.open(url)
#     # doc = Nokogiri::HTML(html)
#     # return doc
#     url = "https://www3.bcb.gov.br/sgspub/consultarmetadados/consultarMetadadosSeries.do?method=consultarMetadadosSeriesInternet&hdOidSerieSelecionada=#{codigo_serie}"
#     html = URI.open(url)
#     doc = Nokogiri::HTML(html)
#     return doc

#   end
# end

class ApiMetadadosService
  def self.busca_metadados
    url = 'https://www3.bcb.gov.br/sgspub/consultarmetadados/consultarMetadadosSeries.do?method=consultarMetadadosSeriesInternet&hdOidSerieSelecionada=12'
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    
    # Find the div with the id 'abaDadosBasicos' and extract the first span element's text
    dados_basicos_div = doc.css('#abaDadosBasicos')
    # texto_span = dados_basicos_div.css('span').first.text.strip
    puts dados_basicos_div
    puts doc.to_html
  end
end

  # base_uri 'https://www3.bcb.gov.br/sgspub/consultarmetadados/consultarMetadadosSeries.do?method=consultarMetadadosSeriesInternet&hdOidSerieSelecionada='

  # def self.busca_metadados
  #   html = URI.open("https://en.wikipedia.org/wiki/Douglas_Adams")
  #   doc = Nokogiri::HTML(html)
  #   puts doc

  # end





# ARQUIVO PRIMARIO
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
