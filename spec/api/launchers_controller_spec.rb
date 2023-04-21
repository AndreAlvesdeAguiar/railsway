require 'rails_helper'

describe Api::V1::LaunchersController do
  include ApiAsJsonHelper

  let!(:launch) { create(:launch) }
  let!(:auth_token) { create(:token) }
  let(:key) { auth_token.key }

  describe 'GET api/v1/' do
    context 'when called' do
      it 'return a message' do
        get '/api/v1/', headers: { Authorization: "Token #{key}" }

        expect(JSON.parse(response.body)).to eq({"message" => "REST Back-end Challenge 20201209 Running"})
      end
    end
  end

  describe 'GET api/v1/import_launchers' do
    context 'when called' do
      it 'return paginated launchers' do
        get '/api/v1/import_launchers', headers: { Authorization: "Token #{key}" }

        expect(JSON.parse(response.body)).to eq({"message"=>"Running launchers import asyncronously"})
      end
    end
  end

  describe 'GET api/v1/launchers' do
    context 'when called' do
      it 'return paginated launchers' do
        get '/api/v1/launchers', headers: { Authorization: "Token #{key}" }

        expect(response.status).to eq 200
        expect(JSON.parse(response.body).except('meta')).to include(
          {'launchers' => Launch.all.map { |launch| launch_as_json(launch) }}
        )
      end
    end
  end

  describe 'POST api/v1/launchers' do
    context 'when corret params was send' do
      it 'creates a launcher' do
        expect {
          post(
            '/api/v1/launchers', headers: { Authorization: "Token #{key}" },
            params: {
              name: 'Launcher Test',
              slug: 'Super Launcher Test',
              import_status: 'draft',
              url: 'http://localhost:3000.com'
            }
          )
        }.to change(Launch, :count).by(1)
      end
    end

    context 'when incorrect params was send' do
      let(:invalid_params) { { invalid_params: "invalid" } }

      it 'doesn\'t creates a launch' do
        post '/api/v1/launchers', params: invalid_params, headers: { Authorization: "Token #{key}" }

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)).to eq({"error" => ["Name can't be blank"]})
      end
    end
  end

  describe 'POST api/v1/launchers/:launch_id' do
    context 'when corret params was send' do
      let(:update_params) do
        {
          name: 'Launch Update',
          slug: 'Super Launch Update',
          phone: 'http://update.com',
        }
      end

      it 'update launcher data' do
        put "/api/v1/launchers/#{launch.id}", params: update_params, headers: { Authorization: "Token #{key}" }

        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to eq(launch_as_json(launch.reload))
      end
    end

    context 'when incorrect params was send' do
      let(:invalid_update_params) do
        {
          id: launch.id.to_s,
          name: "",
        }
      end

      it 'doesn\'t update launcher data' do
        put  "/api/v1/launchers/#{launch.id}", params: invalid_update_params, headers: { Authorization: "Token #{key}" }

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)).to eq({"error" => ["Name can't be blank"]})
      end
    end
  end

  describe 'DELETE api/v1/launchers/:launch_id' do
    context 'when correct params is send' do
      it 'delete launch' do
        delete  "/api/v1/launchers/#{launch.id}", headers: { Authorization: "Token #{key}" }

        expect(response.status).to eq(204)
      end
    end
  end
end
