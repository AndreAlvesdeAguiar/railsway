# frozen_string_literals: true

module Launchers
  class Service
    def initialize
      @client = Launchers::Client.new
    end

    def import_data(url, params)
      @client.get(url, params)
    end
  end
end
