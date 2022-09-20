require 'swagger_helper'

RSpec.describe 'vehicles', type: :request do
  path '/vehicles' do
    get('list vehicles') do
      tags 'Vehicles'
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create vehicle') do
      tags 'Vehicles'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          price: { type: :number, format: :float },
          image: { type: :string },
          visible: { type: :boolean }
        },
        required: %w[name price image visible]
      }
      security [bearerAuth: []]

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/vehicles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show vehicle') do
      tags 'Vehicles'
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update vehicle') do
      tags 'Vehicles'
      consumes 'application/json'
      parameter name: :vehicle, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          price: { type: :number, format: :float },
          image: { type: :string },
          visible: { type: :boolean }
        }
        # required: %w[name price image visible]
      }
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
