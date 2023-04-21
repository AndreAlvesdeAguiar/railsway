require 'swagger_helper'
require 'pry'

RSpec.describe 'api/v1/launchers', type: :request do
  include ApiAsJsonHelper
  let(:token) { create(:token) }
  let(:key) { token.key }

  path '/api/v1' do
    get('Return message') do
      tags("Launchers")
      security([ bearer_auth: [] ])
      description('Return the backend challenge message')
      consumes('application/json')
      produces('application/json')

      response('200', 'Successful') do
        let(:Authorization) { "Token #{key}"}
        schema type: :object, properties: { message: { type: :string, example: 'REST Back-end Challenge 20201209 Running'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code.to_i).to eq(200)
          expect(data).to eq({"message"=>"REST Back-end Challenge 20201209 Running"})
        end
      end

      response('401', 'Authentication failed') do
        let(:Authorization) { "Token 12345"}
        let(:launcher) { }

        schema type: :object, properties: { error: { type: :string, example: 'Invalid token'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("401")
          expect(data['error']).to eq('Invalid token')
        end
      end
    end
  end

  path '/api/v1/import_launchers' do
    get('Import launchers') do
      tags("Launchers")
      security([ bearer_auth: [] ])
      description('Import launchers data assyncronously')
      consumes('application/json')
      produces('application/json')

      response('200', 'Successful') do
        let(:Authorization) { "Token #{key}"}
        schema type: :object, properties: { message: { type: :string, example: 'REST Back-end Challenge 20201209 Running'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code.to_i).to eq(200)
          expect(data).to eq({"message"=>"Running launchers import asyncronously"})
        end
      end

      response('401', 'Authentication failed') do
        let(:Authorization) { "Token 12345"}
        let(:launcher) { }

        schema type: :object, properties: { error: { type: :string, example: 'Invalid token'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("401")
          expect(data['error']).to eq('Invalid token')
        end
      end
    end
  end

  path '/api/v1/launchers' do
    get('List launchers') do
      tags("Launchers")
      security([ bearer_auth: [] ])
      description('Return the list of launchers. 100 per page')
      consumes('application/json')
      produces('application/json')

      response('200', 'Successful') do
        let(:Authorization) { "Token #{key}"}
        run_test! do |response|
          expect(JSON.parse(response.body).except('meta')).to include(
            {'launchers' => Launch.all.map { |launch| launch_as_json(launch) }}
          )
        end
      end

      response('401', 'Authentication failed') do
        let(:Authorization) { "Token 12345"}
        let(:launcher) { }

        schema type: :object, properties: { error: { type: :string, example: 'Invalid token'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("401")
          expect(data['error']).to eq('Invalid token')
        end
      end
    end

    post('Create launcher') do
      tags("Launchers")
      security([ bearer_auth: [] ])
      description('Create a launcher')
      consumes('application/json')
      produces('application/json')
      parameter(name: :launcher, in: :body, schema: { '$ref' => '#/components/schemas/launch' })

      response('200', 'Successful') do
        schema type: :object,
          properties:{
            id: { type: :integer },
            url: { type: :string },
            launch_library_id: { type: :integer },
            slug: { type: :string },
            name: { type: :string },
            net: { type: :string },
            window_end: { type: :string },
            window_start: { type: :string },
            inhold: { type: :boolean },
            tbdtime: { type: :boolean },
            tbddate: { type: :boolean },
            probability: { type: :integer },
            holdreason: { type: :string },
            failreason: { type: :string },
            hashtag: { type: :string },
            webcast_live: { type: :boolean },
            image: { type: :string },
            infographic: { type: :string },
            imported_t: { type: :string },
            import_status: { type: :enum, default: 'draft' },
            launch_service_provider: { type: :hash },
            mission: { type: :hash },
            pad: { type: :hash },
            rocket: { type: :hash },
            status: { type: :hash },
            import_id: { type: :string },
            last_import_code: { type: :string }
          }

        let(:Authorization) { "Token #{key}"}
        let(:launcher) do
          {
            name: 'Launcher Name',
            slug: 'Launcher Slug',
            url:  'www.url.com',
            launch_library_id:  1,
            slug:  'Launcher slug',
            name:  'Launcher name',
            net:  '1957-10-04T19:28:34Z',
            window_end:  "1957-10-04T19:28:34Z",
            window_start:  "1957-10-04T19:28:34Z",
            inhold:  false,
            tbdtime:  false,
            tbddate:  false,
            probability:  1,
            holdreason:  'nil',
            failreason:  'nil',
            hashtag:  'nil',
            webcast_live:  false,
            image:  'www.image_url.com',
            infographic:  'nil',
            import_status: :trash,
            import_id: '12345-6789',
            last_import_code: 'abcd1234',
            launch_service_provider: "{ teste: 'teste' }",
            mission: "{ teste: 'teste' }",
            pad: "{ teste: 'teste' }",
            rocket: "{ teste: 'teste' }",
            status: "{ teste: 'teste' }"
          }
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("200")
        end
      end

      response('401', 'Authentication failed') do
        let(:Authorization) { "Token 12345"}
        let(:launcher) { }

        schema type: :object, properties: { error: { type: :string, example: 'Invalid token'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("401")
          expect(data['error']).to eq('Invalid token')
        end
      end

      response('422', 'Unprocessable entity') do
        let(:Authorization) { "Token #{key}"}
        schema type: :object, properties: { slug: { type: :string, example: "Name can't be blank"}}

        let(:launcher)  {  }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data).to include("error")
        end
      end
    end
  end

  path '/api/v1/launchers/{launcher_id}' do
    parameter name: 'launcher_id', in: :path, type: :string, description: 'id'

    get('Show launcher') do
      tags("Launchers")
      security([ bearer_auth: [] ])
      description('Return an secific launcher by id')
      consumes('application/json')
      produces('application/json')

      response('200', 'Successful') do
        let(:Authorization) { "Token #{key}"}
        schema type: :object, properties:{ launcher_id: { type: :integer } }

        let(:launcher_id) { create(:launch).id }
        run_test!
      end

      response('401', 'Authentication failed') do
        let(:Authorization) { "Token 12345"}
        let(:launcher_id) { create(:launch).id }
        let(:launcher) { }

        schema type: :object, properties: { error: { type: :string, example: 'Invalid token'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("401")
          expect(data['error']).to eq('Invalid token')
        end
      end

      response('404', 'Return message') do
        let(:Authorization) { "Token #{key}"}
        let(:launcher_id) { create(:launch).id }

        schema type: :object, properties:{ launcher_id: { type: :integer } }

        let(:launcher_id) { 1234 }
        run_test!
      end
    end

    put('Update launcher') do
      tags("Launchers")
      security([ bearer_auth: [] ])
      description('Update an specific launcher')
      consumes('application/json')
      produces('application/json')
      parameter(name: :launcher, in: :body, schema: { '$ref' => '#/components/schemas/launch' })

      response('200', 'Successful') do
        let(:Authorization) { "Token #{key}"}
        schema properties:{ launcher_id: { type: :integer }, name: { type: :string} }

        let(:launcher) { create(:launch).id }
        let(:launcher_id) { 1 }
        run_test!
      end

      response('401', 'Authentication failed') do
        let(:Authorization) { "Token 12345"}
        let(:launcher_id) { create(:launch).id }
        let(:launcher) {}

        schema type: :object, properties: { error: { type: :string, example: 'Invalid token'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("401")
          expect(data['error']).to eq('Invalid token')
        end
      end

      response('404', 'Return message') do
        let(:Authorization) { "Token #{key}"}
        schema type: :object, properties:{ launcher_id: { type: :integer } }

        let(:launcher_id) { 1234 }
        let(:launcher) {}
        run_test!
      end
    end

    delete('Delete launcher') do
      tags("Launchers")
      security([ bearer_auth: [] ])
      description('Delete an specficic launcher')
      consumes('application/json')
      produces('application/json')

      response('204', 'Successful') do
        schema type: :object, properties:{ launcher_id: { type: :integer } }

        let(:Authorization) { "Token #{key}"}
        let(:launcher_id) { create(:launch).id }

        after do |example|
          expect(request.body.to_s).to eq("")
        end
      end

      response('401', 'Authentication failed') do
        let(:Authorization) { "Token 12345"}
        let(:launcher_id) { create(:launch).id }
        let(:launcher) { }

        schema type: :object, properties: { error: { type: :string, example: 'Invalid token'}}
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response.code).to eq("401")
          expect(data['error']).to eq('Invalid token')
        end
      end

      response('404', 'Return message') do
        let(:Authorization) { "Token #{key}"}
        schema type: :object, properties:{ launcher_id: { type: :integer } }

        let(:launcher_id) { 1234 }
        run_test!
      end
    end
  end
end
