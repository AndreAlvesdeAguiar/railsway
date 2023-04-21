require 'swagger_helper'

RSpec.describe 'api/v1/tokens', type: :request do

  path '/api/v1/get_token' do

    get('Token') do
      tags("Token")

      response('200', 'Successful') do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data).to include('token')
          expect(data).to include('expiration')
        end
      end
    end
  end
end
