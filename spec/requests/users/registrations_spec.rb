require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  path '/users' do
    post('new registration') do
      tags 'User Registrations'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              username: { type: :string },
              email: { type: :string, pattern: '^\S+@\S+\.\S+$', format: :email },
              role: { type: :string },
              password: { type: :string, format: :password },
              password_confirmation: { type: :string, format: :password }
            },
            required: %w[username email role password password_confirmation]
          }
        },
        required: %w[user]
      }

      response(200, 'Created account successfully.') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'Bad request, check your inputs.') do
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

      response(422, 'Cannot create accounts with those inputs.') do
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
