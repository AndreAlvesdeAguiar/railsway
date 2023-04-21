# frozen_string_literals: true

module Launchers
  class Client
    include HTTParty

    def get(url, params)
      self.class.get(url, query: params)
    end
  end
end
