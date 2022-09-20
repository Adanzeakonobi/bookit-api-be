require 'swagger_helper'

RSpec.describe 'users/sessions', type: :request do

  path '/users/sign_in' do

    post('create session') do

      tags 'Users Sessions'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, pattern: '^\S+@\S+\.\S+$', format: :email },
          password: { type: :string, format: :password }
        },
        required: %w[email password]
      }

      response(200, 'successful') do

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

  path '/users/sign_out' do

    delete('delete session') do
      tags 'Users Sessions'
      response(200, 'successful') do

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
