require 'swagger_helper'

RSpec.describe 'uploadcare', type: :request do
  path '/uploadcare/auth_params' do
    get('generate uploadcare authentication parameters') do
      tags 'UploadCare'
      security [bearerAuth: []]

      response(200, 'UploadCare authentication parameters generated.') do
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
