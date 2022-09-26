require 'swagger_helper'

RSpec.describe 'imagekit', type: :request do
  path '/imagekit/auth_params' do
    get('generate imagekit authentication parameters') do
      tags 'Imagekit'
      security [bearerAuth: []]

      response(200, 'Imagekit authentication parameters generated.') do
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

      response(401, 'The current token is not authorized or has expired.') do
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
end
