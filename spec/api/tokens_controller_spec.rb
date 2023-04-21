require 'rails_helper'

describe Api::V1::TokensController, type: :request do
  include ApiAsJsonHelper

  let(:last_token) { Token.last }

  describe 'GET api/v1/token' do
    context 'when called' do
      it 'return a message' do
        get '/api/v1/get_token'

        expect(JSON.parse(response.body)).to eq(token_as_json(last_token))
      end
    end
  end
end
