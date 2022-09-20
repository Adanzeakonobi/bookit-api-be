require 'swagger_helper'

# rubocop:disable Metrics/BlockLength

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      security [bearerAuth: []]

      response(200, 'successful') do
        let(:"Authorization") { "Bearer #{token_for(user)}" }
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

    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date },
          city: { type: :string },
          vehicle_id: { type: :integer },
          user_id: { type: :integer }
        },
        required: %w[date city vehicle_id user_id]
      }
      security [bearerAuth: []]

      response(200, 'successful') do
        let(:"Authorization") { "Bearer #{token_for(user)}" }
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
# rubocop:enable Metrics/BlockLength
